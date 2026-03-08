class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = SYSTEM_PROMPT = <<~PROMPT
    Extract all products and their prices from this flyer.
    You MUST return the results using the provided tool.
    Do not respond with text.
    Only call the tool.
    Each product must contain:
    - name
    - description
    - keyword
    - price_without_tax
    - price_with_tax

    Example tool output:
    {
      "scanned_products": [
        {
          "name": "キャベツ",
          "description": "群馬県産",
          "keyword": "野菜",
          "price_without_tax": 198,
          "price_with_tax": 213
        }
      ]
    }
  PROMPT

  def perform(scan)
    process_scan(scan) if scan.flyer.attached?
  end

  private

  def process_scan(scan)
    store = scan.store
    flyer = scan.flyer
    tool = FlyerReaderTool.new(store)
    media = { image: { image: flyer.url }, pdf: { pdf: flyer.url } }
    llm = { gemini: { model: 'gemini-2.0-flash', provider: :azure }, gpt: { model: 'gpt-4.1-nano', provider: :openai } }
    if flyer.blob.content_type == "application/pdf"
      generate_prices_with_llm(llm[:gemini], media[:pdf], tool, scan)
    elsif flyer.image?
      generate_prices_with_llm(llm[:gpt], media[:image], tool, scan)
    end
  end

  def generate_prices_with_llm(llm, media, tool, scan)
    chat = RubyLLM.chat(model: llm[:model], provider: llm[:provider], assume_model_exists: true)
                  # .with_schema(FlyerSchema)
                  .with_tool(tool).on_tool_result do |products|
                    scan.update(llm_raw_output: products)
                    products.each do |p|
                      # p = p.with_indifferent_access
                      product = Product.find_or_create_by(
                        name: p["name"],
                        description: p["description"],
                        keyword: p["keyword"]
                      )
                      price = Price.new(
                        store_id: @store.id,
                        product_id: product.id,
                        price_without_tax: p["price_without_tax"],
                        price_with_tax: p["price_with_tax"]
                      )
                    end
                    ScanPrice.create(price: price, scan: scan)
                    puts "🎴 ScanPrice instance created ..."
                  end
    chat.ask(SYSTEM_PROMPT, with: media)
    Rails.logger.info("Processing scan #{scan.id}")
  end
end


# if product.save
#   { success: true, product_id: product.id }
# else
#   { success: false, errors: product.errors.full_messages }
# end

#                       if price.save
#   { success: true, price_id: price.id, product_id: product.id }
#   prices << price
# else
#   { success: false, errors: price.errors.full_messages }
# end
