class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = "Extract all products and prices from this flyer.
                  Use the tool to return an array of products with their prices.
                  If a product or price cannot be found, leave the field blank."
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
                  .with_tool(tool).on_tool_result do |prices|
                    pp prices
                    prices.each do |price|
                      ScanPrice.create(price_id: price.id, scan: scan)
                      puts "🎴 ScanPrice instance created ..."
                    end
                  end
    chat.ask(SYSTEM_PROMPT, with: media)
    puts "processing scan ..."
  end
end
