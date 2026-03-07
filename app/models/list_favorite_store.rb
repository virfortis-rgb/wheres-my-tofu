class ListFavoriteStore < ApplicationRecord
  belongs_to :list
  belongs_to :store

  validates :store_id, uniqueness: { scope: :list_id }
end
