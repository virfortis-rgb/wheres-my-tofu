class FlyerReaderTool < RubyLLM::Tool
  description "Use this tool to extract products and prices from a flyer and create an array of prices.
              Keep the product name and description in Japanese."
  def initialize(store)
    @store = store
  end

  params do
    array :scanned_products do
      object do
        string :name, description: "Product name"
        string :description, description: "Additional description"
        string :keyword, description: "category keyword"
        number :price_without_tax, description: "Price excluding tac"
        number :price_with_tax, description: "Price includinfg tax"
      end
    end
  end

  def execute(scanned_products:)
    prices = []
    scanned_products.each do |p|
      p = p.with_indifferent_access
      product = Product.find_or_create_by(
        name: p[:name],
        description: p[:description],
        keyword: p[:keyword]
      )
      price = Price.new(
        store_id: @store.id,
        product_id: product.id,
        price_without_tax: p[:price_without_tax],
        price_with_tax: p[:price_with_tax]
      )
      prices << price
    end
    return prices
  end
end


  # if product.save
    #   { success: true, product_id: product.id }
    # else
    #   { success: false, errors: product.errors.full_messages }
    # end

       # if price.save
    #   { success: true, price_id: price.id, product_id: product.id }
    #   prices << price
    # else
    #   { success: false, errors: price.errors.full_messages }
    # end
