class FlyerReaderTool < RubyLLM::Tool
  description "Use this tool to extract products, stores, and prices from a flyer and add it to the DB.
              If the product, store, or price does not already exist, create them."

  param :product_name, desc: "The name of the product"
  param :product_decsription, desc: "The description of this product"
  param :product_keyword, desc: "One keyword to define this product"

    # TODO User has to specify store, when uploading image
  param :store_name, desc: "The name of the store"
  param :store_address, desc: "The address of the store"
  param :store_longitude, desc: "The longitude of the store"
  param :store_latitude, desc: "The latitude of the store"

  param :price_store_id, desc: "The store_id of the store"
  param :price_product_id, desc: "The product_id of the relevant product"
  param :price_without_tax, desc: "The price without tax"
  param :price_with_tax, desc: "The price with tax (税込)"


  def execute(product_name:, product_decsription:, product_keyword:, store_name:, store_address:, store_longitude:, store_latitude:, price_store_id:, price_product_id:, price_without_tax:, price_with_tax:)
    product = Product.new(
      name: product_name,
      description: product_decsription,
      keyword: product_keyword
    )
    if product.save
      { success: true, product_id: product.id}
    else
      { success: false, errors: product.errors.full_messages }
    end

    store = Store.new(
      name: store_name,
      address: store_address,
      longitude: store_longitude,
      latitude: store_latitude
    )
    if store.save
      { success: true, store_id: store.id}
    else
      { success: false, errors: store.errors.full_messages }
    end

    price = Price.new(
      store_id: price_store_id,
      product_id: price_product_id,
      price_without_tax: price_without_tax,
      price_with_tax: price_with_tax
    )
    if price.save
      { success: true, price_id: price.id}
    else
      { success: false, errors: price.errors.full_messages }
    end
  end
end
