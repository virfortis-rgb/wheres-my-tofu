class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = <<~PROMPT
    Extract all products and their prices from this flyer.
    You MUST return the results using the provided tool.
    Do not respond with text.
    Only call the tool.
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
    llm = { gemini: { model: 'gemini-2.5-flash-lite', provider: :azure }, gpt: { model: 'gpt-4.1-nano', provider: :openai } }
    if flyer.blob.content_type == "application/pdf"
      generate_prices_with_llm(llm[:gemini], media[:pdf], tool, scan)
    elsif flyer.image?
      generate_prices_with_llm(llm[:gemini], media[:image], tool, scan)
    end
  end

  def generate_prices_with_llm(llm, media, tool, scan)
    chat = RubyLLM.chat(model: llm[:model]).with_tool(tool)
                  .on_tool_result do |prices|
                    pp prices
                    scan.update(llm_raw_output: prices)
                    prices.each do |price|
                      ScanPrice.create(price: price, scan: scan)
                    end
                  end
    chat.ask(SYSTEM_PROMPT, with: media)
    Rails.logger.info("Processing scan #{scan.id}")
  end
end
