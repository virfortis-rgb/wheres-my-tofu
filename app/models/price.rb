class Price < ApplicationRecord
  belongs_to :store
  belongs_to :product
  has_many :items
end
