class Item < ApplicationRecord
  belongs_to :list
  belongs_to :price, optional: true

  validates :name, presence: :true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  before_save :auto_assign_lowest_price, if: -> { keyword_changed? || price_id.nil? }


  def prices_grouped_by_store(store_ids: nil)
    prices = available_prices(store_ids: store_ids).order(price_with_tax: :asc)

    prices.group_by(&:store)
  end

  def available_in_stores?(store_ids)
    available_prices(store_ids: store_ids).exists?
  end

  def lowest_available_price_for(store_ids: nil)
    lowest_available_price(store_ids: store_ids)
  end

  def auto_assign_lowest_price
    favorite_store_ids = list.favorite_store_ids.presence
    price_for_item = lowest_available_price(store_ids: favorite_store_ids)
    self.price = price_for_item if price_for_item
  end

  def display_total_price
    return "¥ --" unless price
    "¥%.1f" % (price.price_with_tax * quantity)
  end

  def savings_if_cheapest(store_ids: nil)
    cheapest_price = lowest_available_price(store_ids: store_ids)
    return 0 if price_id.nil? || cheapest_price.nil? || price.price_with_tax <= cheapest_price.price_with_tax

    (price.price_with_tax - cheapest_price.price_with_tax) * quantity
  end

  private

  def available_prices(store_ids: nil)
    scope = Price.includes(:store, :product).where(product_id: matching_product_ids)
    return scope unless store_ids.present?

    scope.where(store_id: store_ids)
  end

  def matching_product_ids
    @matching_product_ids = Product.where("keyword ILIKE :q OR name ILIKE :q OR description ILIKE :q", q: "%#{keyword}%").pluck(:id)
  end

  def lowest_available_price(store_ids: nil)
    available_prices(store_ids: store_ids).order(price_with_tax: :asc).first
  end
end
