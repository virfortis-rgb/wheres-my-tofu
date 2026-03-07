class CreateListFavoriteStores < ActiveRecord::Migration[7.1]
  def change
    create_table :list_favorite_stores do |t|
      t.references :list, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end

    add_index :list_favorite_stores, [:list_id, :store_id], unique: true
  end
end
