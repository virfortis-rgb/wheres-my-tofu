class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # set the llm
    # give scan to llm
    # get json back
    # add to DB
  end
end
