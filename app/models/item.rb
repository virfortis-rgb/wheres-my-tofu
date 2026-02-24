class Item < ApplicationRecord
  belongs_to :list
  belongs_to :price, optional: true

  validates :name, presence: :true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  before_save :auto_assign_lowest_price, if: -> { keyword_changed? || price_id.nil? }


  def prices_grouped_by_store
    product_ids = Product.where("keyword ILIKE :q OR name ILIKE :q", q: "%#{keyword}%").pluck(:id)

    prices = Price.includes(:store, :product)
                  .where(product_id: product_ids)
                  .order(price_with_tax: :asc)

    prices.group_by(&:store)
  end

  def auto_assign_lowest_price
    product_ids = Product.where("keyword ILIKE :q OR name ILIKE :q", q: "%#{keyword}%").pluck(:id)
    return if product_ids.empty?

    lowest = Price.where(product_id: product_ids).order(price_with_tax: :asc).first
    self.price = lowest if lowest
  end

  def display_total_price
    return "¥ --" unless price
    "¥#{(price.price_with_tax * quantity)}"
  end
end
