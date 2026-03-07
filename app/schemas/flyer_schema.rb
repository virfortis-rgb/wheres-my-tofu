class FlyerSchema < RubyLLM::Schema
  array :scanned_products do
    object do
      string :name, description: "商品名"
      string :description, description: "商品説明文"
      string :keyword, description: "One keyword to define this product"
      string :price_without_tax, description: "The price without tax"
      string :price_with_tax, description: "The price with tax (税込)"
    end
  end
end
