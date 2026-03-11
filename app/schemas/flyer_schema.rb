class FlyerSchema < RubyLLM::Schema
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
