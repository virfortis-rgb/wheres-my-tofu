class AddFlyerDataToDbJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = "describe this image"

  def perform(scan)
    if scan.file.attached?
      process_scan(scan.file) # TODOturn into task
      # scanned_products.each_with_index do |product, index|
      #   single_product = Product.find_or_create_by!(name: product[:product][:name], description: product[:product][:description], keyword: product[:product][:keyword])
      #   store = Store.find_or_create_by!(name: product[:store][:name], address: product[:store][:address], latitude: price[:store][:latitude], longitude: product[:store][:longitude])
      #   Price.create!(
      #     product: single_product,
      #     store: store,
      #     price_without_tax: product[:prices][:price_without_tax],
      #     price_with_tax: product[:prices][:price_with_tax]
      #   )
      #   index == 0 ? p "Created 1 product" : p "Created #{index + 1} products"
      # end
    end

    private

    def process_scan(file)
      if file.content_type == "application/pdf"
        chat = RubyLLM.chat(model: "gemini-2.0-flash")
        chat.with_instructions(SYSTEM_PROMPT)
        @response = chat.ask(scan.content, with: { pdf: scan.file.url})
        sleep(45)
      elsif flyer.image?
        chat = RubyLLM.chat(model: 'gpt-4o')
        chat.with_instructions(SYSTEM_PROMPT)
        @response = chat.ask(scan.content, with: { pdf: scan.file.url})
        sleep(45)
      end
      puts @response
    end
  end
end
