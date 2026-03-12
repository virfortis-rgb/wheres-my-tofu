class FlyerReaderTool < RubyLLM::Tool
  description "Use this tool to extract products and prices from a given flyer and create an array of prices.
  Keep the product name and description in Japanese."

  def initialize(store)
    @store = store
  end

  params do
    array :scanned_products do
      object do
        string :name, description: "Product name", required: true
        string :description, description: "Product description", required: true
        string :keyword, description: "category keyword"
        number :price_without_tax, description: "Price excluding tax", required: true
        number :price_with_tax, description: "Price including tax", required: true
      end
    end
  end

  def execute(scanned_products:)
    prices = []
    scanned_products.each do |p|
      p = p.with_indifferent_access
      # next if p[:name].blank?
      product = Product.find_or_create_by(
        name: p[:name],
        description: p[:description],
        keyword: p[:keyword]
      )
      pp product
      price = Price.create(
        store: @store,
        product: product,
        price_without_tax: p[:price_without_tax],
        price_with_tax: p[:price_with_tax]
      )
      pp price
      prices << price
    end
    return prices
  end
end
