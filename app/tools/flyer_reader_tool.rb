class FlyerReaderTool < RubyLLM::Tool
  # description "このツールは、チラシから商品名と価格を抽出してデータベースに追加するために使用します。
  #             商品または価格が既にデータベースに存在しない場合は、新しく作成してください。
  #             該当する情報が見つからない場合は、空欄のままにしてください。"
              "Use this tool to extract products and prices from a flyer and add it to the DB.
              If the product or price does not already exist in the DB, create them.
              Keep the product name and description in Japanese."
  # refactor to follow runby LLm schema gem structure
  param :product_name, desc: "商品名"
  param :product_description, desc: "商品説明文"
  param :product_keyword, desc: "One keyword to define this product"


  param :price_store_id, desc: "The store_id of the store"
  param :price_without_tax, desc: "The price without tax"
  param :price_with_tax, desc: "The price with tax (税込)"

# Todo update arguments, receive array of products
  def execute(product_name:, product_description:, product_keyword:, price_store_id:, price_without_tax:, price_with_tax:)

    # itirate over array .each
    product = Product.find_or_create_by(
      name: product_name,
      description: product_description,
      keyword: product_keyword
    )
    if product.save
      { success: true, product_id: product.id}
    else
      { success: false, errors: product.errors.full_messages }
    end

    # price = Price.new(
  #     store_id: price_store_id,
  #     product_id: product.id,
  #     price_without_tax: price_without_tax,
  #     price_with_tax: price_with_tax
  #   )
  #   if price.save
  #     { success: true, price_id: price.id, product_id: product.id}
  #   else
  #     { success: false, errors: price.errors.full_messages }
  #   end
  # end

# return array of prices
end
