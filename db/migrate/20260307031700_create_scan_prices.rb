class CreateScanPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :scan_prices do |t|
      t.references :price, null: false, foreign_key: true
      t.references :scan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
