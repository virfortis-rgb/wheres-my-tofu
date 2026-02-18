class Item < ApplicationRecord
  belongs_to :list
  belongs_to :price, optional: true
  # add this line to allow to access price on show page through item.price

  validates :name, presence: :true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  def find_products
    products = Product.where(name: self.name)
  end
end
