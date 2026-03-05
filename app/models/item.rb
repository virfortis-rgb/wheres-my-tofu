class Item < ApplicationRecord
  belongs_to :list
  belongs_to :price, optional: true

  validates :name, presence: :true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  before_save :auto_assign_lowest_price, if: -> { keyword_changed? || price_id.nil? }


  def prices_grouped_by_store
    prices = Price.includes(:store, :product)
                  .where(product_id: matching_product_ids)
                  .order(price_with_tax: :asc)

    prices.group_by(&:store)
  end

  def auto_assign_lowest_price
    if lowest_available_price
      self.price = lowest_available_price
    end
  end

  def display_total_price
    return "¥ --" unless price
    "¥%.1f" % (price.price_with_tax * quantity)
  end

  def savings_if_cheapest
    return 0 if price_id.nil? || price.price_with_tax <= lowest_available_price.price_with_tax
    (price.price_with_tax - lowest_available_price.price_with_tax) * quantity
  end

  private

  def matching_product_ids
    @matching_product_ids = Product.where("keyword ILIKE :q OR name ILIKE :q", q: "%#{keyword}%").pluck(:id)
  end

  def lowest_available_price
    @lowest_available_price = Price.where(product_id: matching_product_ids).order(price_with_tax: :asc).first
  end
end
