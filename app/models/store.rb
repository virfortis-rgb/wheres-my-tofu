class Store < ApplicationRecord
  has_many :prices

  validates :name, :address, :longitude, :latitude, presence: :true
  validates :address, uniqueness: :true
end
