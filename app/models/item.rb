class Item < ApplicationRecord
  belongs_to :list
  belongs_to :price, optional: true
  # add this line to allow to access price on show page through item.price

  validates :name, presence: :true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  def find_products
    Product.where("keyword ILIKE ?", "%#{keyword}%")
  end
end


    # sql_subquery = <<~SQL
    #   movies.title ILIKE :query
    #   OR movies.synopsis ILIKE :query
    #   OR directors.first_name ILIKE :query
    #   OR directors.last_name ILIKE :query
    # SQL
    # @movies = @movies.joins(:director).where(sql_subquery, query: "%#{params[:query]}%")
