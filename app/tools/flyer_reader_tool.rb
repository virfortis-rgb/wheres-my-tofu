class FlyerReaderTool < RubyLLM::Tool
  description "Use this tool to extract products and prices from a flyer and create an array of prices.
              Keep the product name and description in Japanese."
  def initialize(store)
    @store = store
  end

  params do
    object :scanned_product do
      string :name, description: "商品名"
      string :description, description: "商品説明文"
      string :keyword, description: "One keyword to define this product"
      number :price_without_tax, description: "税抜き価格"
      number :price_with_tax, description: "税込価格"
      # string :store_id, description: @store.id
    end
  end

  # Todo update arguments, receive array? of products => array gives a NoMethodError
  def execute(scanned_product:)
    prices = []
    # p = p.with_indifferent_access
    product = Product.find_or_create_by(
      name: p[:name],
      description: p[:description],
      keyword: p[:keyword]
    )
    if product.save
      { success: true, product_id: product.id }
    else
      { success: false, errors: product.errors.full_messages }
    end
    price = Price.new(
      store_id: @store.id,
      product_id: product.id,
      price_without_tax: p[:price_without_tax],
      price_with_tax: p[:price_with_tax]
    )
    if price.save
      { success: true, price_id: price.id, product_id: product.id }
      prices << price
    else
      { success: false, errors: price.errors.full_messages }
    end
    prices
  end
end
