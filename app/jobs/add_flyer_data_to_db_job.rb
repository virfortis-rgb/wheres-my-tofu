class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = "Extract data from this image/pdf and add it to the DB."

  def perform(scan)
    if scan.flyer.attached?
      process_scan(scan)
    end
  end

    private

  def process_scan(scan)
    store = scan.store
    flyer = scan.flyer
    prompt = "#{SYSTEM_PROMPT}, store contenxt for this flyer:
      the store_name is #{store.name},
      the store_address is #{store.address},
      the store_longitude is #{store.longitude},
      the store_latitude is #{store.latitude},
      the store_id is #{store.id}
      IMPORTANT: use store id for price_store_id param!
      "
    if flyer.content_type == "application/pdf"
      chat = RubyLLM.chat(model: "gemini-2.0-flash").with_tool(FlyerReaderTool)
      # chat.with_instructions(SYSTEM_PROMPT)
      chat.ask(prompt, with: { pdf: flyer.url})
      puts "processing scan ..."
    elsif flyer.image?
      chat = RubyLLM.chat(model: 'gpt-4o').with_tool(FlyerReaderTool)
      # chat.with_instructions(SYSTEM_PROMPT)
      chat.ask(prompt, with: { image: flyer.url})
      puts "processing scan ..."
    end
  end
end
