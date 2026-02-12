class Product < ApplicationRecord
  has_many :prices

  validates :name, presence: :true
end
