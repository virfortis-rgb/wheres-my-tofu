class RetrieveProductInfoFromChirashiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Starting chirashi retrieval for #place."
    # scrape shufoo for newest and most relavant chirashis for given area, using OpenURI ?
      # need shop ids
    shop_ids = {
      "フジ南宇和店": 267098,
      "エースワン": 258215
    }
    shufoo_base_url = "https://www.shufoo.net/pntweb/shopDetail/#{shop_id}/"
    # nokogiri it to get img url

    # feed those chirashis images urls to ruby_llm to parse into JSON readable by the DB, sleep between each chirashi
    # Product.find_or_create_by! as well as Store.find_or_create_by!
    # update price

    puts "Product information in #place area updated from chirashi."
  end
end
