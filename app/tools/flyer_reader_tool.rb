class FlyerReaderTool < RubyLLM::Tool
  description "Use this tool to extract products and prices from a flyer and create an array of prices.
              Keep the product name and description in Japanese."
  def initialize(store)
    @store = store
  end

  params do
    array :scanned_products do
      string :name, description: "商品名"
      string :description, description: "商品説明文"
      string :keyword, description: "One keyword to define this product"
      number :price_without_tax, description: "税抜き価格"
      number :price_with_tax, description: "税込価格"
      # string :store_id, description: @store.id
    end
  end

  # Todo update arguments, receive array? of products => array gives a NoMethodError
  def execute(scanned_products:)
    scanned_products
  end
end
