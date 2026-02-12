class Item < ApplicationRecord
  belongs_to :list
  belongs_to :product
  has_many :prices, through: :products

  validates :name, presence: :true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
