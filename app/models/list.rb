class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :prices, through: :items
  has_many :stores, through: :prices

  validates :name, presence: :true
end
