class RetrieveProductInfoFromChirashiJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = <<~PROMPT
    Use the following flyer and generate a JSON in the following formating:
  PROMPT

  def perform(*args)
    puts "Starting chirashi retrieval for #place."
    # scrape shufoo for newest and most relavant chirashis for given area, using OpenURI ?
      # need shop ids
    shop_ids = {
      "フジ南宇和店": 267098,
      "エースワン": 258215
    }
    chirashi_image_urls = []

    shop_ids.values.each do |shop_id|
      shufoo_base_url = "https://www.shufoo.net/pntweb/shopDetail/#{shop_id}/"
      uri = Addressable::URI.parse(shufoo_base_url).display_uri.to_s

      doc = Nokogiri::HTML.parse(uri)
      doc.search('.sd_cl_item_thumb img').map do |img| # all css selectors on this page return nil
        chirashi_image_urls << img[url]
      end
    end

    # feed those chirashis images urls to ruby_llm to parse into JSON readable by the DB,
    # sleep between each chirashi
    llm = RubyLLM.chat(model: 'gpt-4o') # TODO Configure LLM and API keys
    chirashi_image_urls.each do |chirashi|
      chirashi_json = chat.ask SYSTEM_PROMPT, with: { image: chirashi }
      Product.find_or_create_by!(TODO)
      Store.find_or_create_by!(TODO)
      Price.find_or_create_by!(TODO)
      puts "sleeping..."
      count = 0
      60.times do
        sleep(1)
        print (60 - count).to_s + '\r'
        count += 1
      end
    end

    puts "Product information in #place area updated from chirashi."
  end
end
