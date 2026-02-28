class Store < ApplicationRecord
<<<<<<< HEAD
  has_many :scans
=======
  has_many :prices
>>>>>>> master

  validates :name, :address, :longitude, :latitude, presence: :true
  validates :address, uniqueness: :true
end
