# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# testing seeds：
puts "Cleaning database..."
Item.destroy_all
List.destroy_all
Price.destroy_all
Product.destroy_all
Store.destroy_all
User.destroy_all


puts "Creating users..."
user = User.create!(
  email: "me@me.com",
  password: "123456"
)

puts "Creating stores..."
aeon = Store.create!(name: "AEON Edogawa", address: "Tokyo, Edogawa-ku, 123 Street", latitude: 35.68, longitude: 139.85)
life = Store.create!(name: "Life Edogawa", address: "Tokyo, Edogawa-ku, 456 Avenue", latitude: 35.69, longitude: 139.86)


puts "Creating products..."
tofu = Product.create!(name: "相模屋食料 絹 400g", description: "なめらかな食感の絹とうふです")
milk = Product.create!(name: "明治 おいしい牛乳 900ml", description: "生乳の風味が分かる専門家が品質をチェックしたこだわりの生乳を使用。")
eggs = Product.create!(name: "クレスト たこたま 赤玉 10個入", description: "千葉県多古町産のたまごです。")


puts "Creating prices..."
p1 = Price.create!(product: tofu, store: aeon, price_without_tax: 98, price_with_tax: 106)
p2 = Price.create!(product: tofu, store: life, price_without_tax: 88, price_with_tax: 95)
p3 = Price.create!(product: milk, store: aeon, price_without_tax: 198, price_with_tax: 213)
p4 = Price.create!(product: eggs, store: life, price_without_tax: 250, price_with_tax: 270)


puts "Creating lists..."
my_list = List.create!(name: "Weekly Grocery", user: user)

puts "Adding items to list..."
Item.create!(name: "Tofu", quantity: 2, list: my_list, price: p2)
Item.create!(name: "Milk", quantity: 1, list: my_list, price: p3)

puts "Finished! Created #{User.count} user, #{Store.count} stores, #{Product.count} products, and #{List.count} list."
