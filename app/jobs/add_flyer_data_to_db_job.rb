class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  def perform(scan)
    # set the llm
    # give scan to llm
    # get json back
    # add to DB
  end
end
