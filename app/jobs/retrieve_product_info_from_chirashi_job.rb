class RetrieveProductInfoFromChirashiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Starting chirashi retrieval for place."

    puts "Product information in #place area updated from chirashi."
  end
end
