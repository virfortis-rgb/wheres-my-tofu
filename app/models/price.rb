class Price < ApplicationRecord
  belongs_to :store
  belongs_to :product

  validates :product, presence: :true
end
