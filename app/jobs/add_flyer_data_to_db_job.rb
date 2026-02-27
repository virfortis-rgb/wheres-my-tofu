class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = "Extract data from this image/pdf and add it to the DB"

  def perform(scan)
    if scan.flyer.attached?
      process_scan(scan.flyer)
    end
  end

    private

  def process_scan(flyer)
    if flyer.content_type == "application/pdf"
      chat = RubyLLM.chat(model: "gemini-2.0-flash").with_tool(FlyerReaderTool)
      # chat.with_instructions(SYSTEM_PROMPT)
      chat.ask(SYSTEM_PROMPT, with: { pdf: flyer.url})
      puts "processing scan ..."
    elsif flyer.image?
      chat = RubyLLM.chat(model: 'gpt-4o').with_tool(FlyerReaderTool)
      # chat.with_instructions(SYSTEM_PROMPT)
      chat.ask(SYSTEM_PROMPT, with: { pdf: flyer.url})
      puts "processing scan ..."
    end
  end
end
