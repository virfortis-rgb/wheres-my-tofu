class Scan < ApplicationRecord
  belongs_to :store
  has_many :scan_prices
  has_many :prices, through: :scan_prices
  has_one_attached :flyer
end
