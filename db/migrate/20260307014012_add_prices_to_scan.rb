class AddPricesToScan < ActiveRecord::Migration[7.1]
  def change
    add_reference :scans, :price, null: false, foreign_key: true
  end
end
