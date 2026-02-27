class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = "describe this image"

  def perform(scan)
    if scan.file.attached?
      process_scan(scan.flyer)
    end

    private

    def process_scan(flyer)
      if flyer.content_type == "application/pdf"
        chat = RubyLLM.chat(model: "gemini-2.0-flash")
        chat.with_tool(flyer_reader_tool)
        # chat.with_instructions(SYSTEM_PROMPT)
        chat.ask(scan.content, with: { pdf: flyer.url})
        puts "processing scan ..."
        sleep(45)
      elsif flyer.image?
        chat = RubyLLM.chat(model: 'gpt-4o')
        chat.with_tool(flyer_reader_tool)
        # chat.with_instructions(SYSTEM_PROMPT)
        chat.ask(scan.content, with: { pdf: flyer.url})
        puts "processing scan ..."
        sleep(45)
      end
    end
  end
end
