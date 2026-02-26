class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = "Generate a json in the following format from each item in this image of a flyer:
                    {
                      "product": {
                        "name": insert product name here,
                        "description": insert product description here,
                        "keyword": add a keyword or an array of keywords here
                      },
                      "store": {
                        "name": insert store name here,
                        "address": insert the address here,
                        "latitude": insert longitude here,
                        "longitude": insert latitude here
                      },
                      "price": {
                        "price_without_tax": insert price here,
                        "price_with_tax": insert 税込 price here
                      }
                    }
                  "


def perform(scan)
  if scan.flyers.attached?
    chat = RubyLLM.chat(model: 'gpt-4o')
    scanned_products
    scan.flyers do |flyer|
    scanned_products << chat.ask SYSTEM_PROMPT, with: { image: scan}
    end

    scanned_products.each_with_index do |product, index|
      single_product = Product.find_or_create_by!(name: product[:product][:name], description: product[:product][:description], keyword: product[:product][:keyword])
      store = Store.find_or_create_by!(name: product[:store][:name], address: product[:store][:address], latitude: price[:store][:latitude], longitude: product[:store][:longitude])
      Price.create!(
        product: single_product,
        store: store,
        price_without_tax: product[:prices][:price_without_tax],
        price_with_tax: product[:prices][:price_with_tax]
      )
      index == 0 ? p "Created 1 product" : p "Created #{index + 1} products"
    end
  end

  private

  def process_scan

  end
end
