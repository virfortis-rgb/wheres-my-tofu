class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = "Generate a json in the following format from this image of a flyer: "

  def perform(scan)
    # set the llm
    chat = RubyLLM.chat(model: 'gpt-4o')
    # give scan to llm
    response = chat.ask SYSTEM_PROMPT, with: { image: scan}
    # add to DB

  end
end
