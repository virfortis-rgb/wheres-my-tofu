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
      number :price_without_tax, description: "The price without tax"
      number :price_with_tax, description: "The price with tax (税込)"
      # string :store_id, description: @store.id
    end
  end

  # Todo update arguments, receive array? of products => array gives a NoMethodError
  def execute(scanned_products:)
    prices = []
    scanned_products.each do |p|
      product = Product.find_or_create_by(
        name: :name,
        description: :description,
        keyword: :keyword
      )
      if product.save
        { success: true, product_id: product.id }
      else
        { success: false, errors: product.errors.full_messages }
      end

      price = Price.new(
        store_id: @store.id,
        product_id: product.id,
        price_without_tax: :price_without_tax.to_s,
        price_with_tax: :price_with_tax.to_s
      )
      if price.save
        { success: true, price_id: price.id, product_id: product.id }
        prices << price
      else
        { success: false, errors: price.errors.full_messages }
      end
    end
    prices
  end
end
