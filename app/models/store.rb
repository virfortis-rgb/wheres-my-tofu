class Store < ApplicationRecord
  validates :name, :address, :longitude, :latitude, presence: :true
  validates :address, uniqueness: :true
end
