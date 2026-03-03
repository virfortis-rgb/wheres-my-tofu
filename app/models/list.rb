class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :prices, through: :items
  has_many :stores, through: :prices

  validates :name, presence: :true

  def active_stores
    stores.distinct
  end

  def all_items_selected?
    items.any? && items.all? { |item| item.price_id.present? }
  end

  def total_potential_savings
    items.sum { |item| item.savings_if_cheapest || 0 }
  end
end
