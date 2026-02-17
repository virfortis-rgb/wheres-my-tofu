class AllowPriceIdToBeNullInItems < ActiveRecord::Migration[7.1]
  def change
    change_column_null :items, :price_id, true
  end
end
