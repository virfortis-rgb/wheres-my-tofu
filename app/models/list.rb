class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :prices, through: :items
  has_many :stores, through: :prices

  validates :name, presence: :true

  def active_stores
    items.filter_map { |item| item.price&.store }.uniq
  end

  def all_items_selected?
    items.any? && items.all? { |item| item.price_id.present? }
  end
end
