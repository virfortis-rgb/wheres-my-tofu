class FlyerReaderTool < RubyLLM::Tool
  description "Use this tool to extract products and prices from a flyer and add create an array of prices.
              Keep the product name and description in Japanese."

  params do
    object :scanned_products do
      string :name, description: "商品名"
      string :description, description: "商品説明文"
      string :keyword, description: "One keyword to define this product"
      string :price_without_tax, description: "The price without tax"
      string :price_with_tax, description: "The price with tax (税込)"
    end
  end

  # Todo update arguments, receive array of products
  def execute(scanned_products:)
    prices = []
    scanned_products.each do |p|
      product = Product.find_or_create_by(
        name: p[:name],
        description: :description,
        keyword: :keyword
      )
      if product.save
        { success: true, product_id: product.id }
      else
        { success: false, errors: product.errors.full_messages }
      end

      price = Price.new(
        # store_id: store_id,
        product_id: product.id,
        price_without_tax: :price_without_tax,
        price_with_tax: :price_with_tax
      )
      if price.save
        { success: true, price_id: price.id, product_id: product.id }
        prices << price
      else
        { success: false, errors: price.errors.full_messages }
      end
    end
    # return array of prices
    prices
  end
end
