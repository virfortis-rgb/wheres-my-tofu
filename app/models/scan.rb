class Scan < ApplicationRecord
  belongs_to :store
  has_many :prices, through: :store
  has_one_attached :flyer
end
