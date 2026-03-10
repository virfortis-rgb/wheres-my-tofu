class Store < ApplicationRecord
  has_many :prices
  has_many :scans, dependent: :destroy
  has_many :list_favorite_stores, dependent: :destroy
  has_many :favorite_lists, through: :list_favorite_stores, source: :list

  validates :name, :address, :longitude, :latitude, presence: :true
  validates :address, uniqueness: :true
end
