class Scan < ApplicationRecord
  belongs_to :store
  has_one_attached :flyer
end
