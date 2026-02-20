class AddKeywordToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :keyword, :string
  end
end
