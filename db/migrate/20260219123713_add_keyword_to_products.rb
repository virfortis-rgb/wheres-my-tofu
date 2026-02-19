class AddKeywordToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :keyword, :string
  end

end
