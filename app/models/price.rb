class Price < ApplicationRecord
  belongs_to :store
  belongs_to :product
  has_many :items
  has_many :scan_prices, dependent: :destroy

  accepts_nested_attributes_for :product
end
