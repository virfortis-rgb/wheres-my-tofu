class AddStoreToScans < ActiveRecord::Migration[7.1]
  def change
    add_reference :scans, :store, null: false, foreign_key: true
  end
end
