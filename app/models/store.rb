class Store < ApplicationRecord
  has_many :prices
  has_many :scans

  validates :name, :address, :longitude, :latitude, presence: :true
  validates :address, uniqueness: :true
end
