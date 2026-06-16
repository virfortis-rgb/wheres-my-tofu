class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = <<~PROMPT
    Extract all products and their prices from this flyer.
    You MUST return an array of prices using the provided tool.
    Only call the tool ONCE.
  PROMPT

  def perform(scan)
    process_scan(scan) if scan.flyer.attached?
  end

  private

  def process_scan(scan)
    store = scan.store
    tool = FlyerReaderTool.new(store)
    generate_prices_with_llm(tool, scan)
  end

  def generate_prices_with_llm(tool, scan)
    chat = RubyLLM.chat(model: 'meta-llama/llama-4-scout-17b-16e-instruct', provider: :openai, assume_model_exists: true)
                  .with_tool(tool)
                  .on_tool_result do |prices|
                    pp prices
                    scan.update(llm_raw_output: prices)
                    prices.each do |price|
                      ScanPrice.create(price_id: price[:id], scan: scan)
                    end
                  end
    chat.ask(SYSTEM_PROMPT, with: scan.flyer.url)
    Rails.logger.info("Processing scan #{scan.id}")
  end
end
