class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = "Take this image\pdf, read all the products and related prices from this image/pdf and add it to the DB"
  def perform(scan)
    process_scan(scan) if scan.flyer.attached?
  end

  private

  def process_scan(scan)
    store = scan.store
    flyer = scan.flyer
    tool = FlyerReaderTool.new(store)
    #   prompt = " store contenxt for this flyer: the store_name is #{store.name},
    #   the store_address is #{store.address},
    #   the store_longitude is #{store.longitude},
    #   the store_latitude is #{store.latitude},
    #   # the store_id is #{store.id}
    #   # IMPORTANT: use the store id for store_id param!"
    if flyer.content_type == "application/pdf"
      chat = RubyLLM.chat(model: "gemini-2.0-flash").with_tool(tool)
      chat.ask(SYSTEM_PROMPT, with: { pdf: flyer.url })
      puts "processing scan ..."
    elsif flyer.image?
      chat = RubyLLM.chat(model: 'gpt-4.1-nano', provider: :openai, assume_model_exists: true)
                    # .with_schema(FlyerSchema)
                    .with_tool(tool)
                    .on_tool_result do |result|
                      # create instances of scan_price out of result (array of prices)
                      pp result
                      result.each do |price|
                        ScanPrice.create(price: price, scan: scan)
                        puts "🎴ScanPrice instance created ..."
                      end
                    end
      chat.ask(SYSTEM_PROMPT, with: { image: flyer.url })
      #
      puts "processing scan ..."
    end
  end
end
