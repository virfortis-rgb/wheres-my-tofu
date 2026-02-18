puts "Cleaning database..."
Item.destroy_all
List.destroy_all
Price.destroy_all
Product.destroy_all
Store.destroy_all

puts "Creating stores..."
aeon = Store.create!(name: "AEON Edogawa", address: "Tokyo, Edogawa-ku, 123 Street", latitude: 35.68, longitude: 139.85)
life = Store.create!(name: "Life Edogawa", address: "Tokyo, Edogawa-ku, 456 Avenue", latitude: 35.69, longitude: 139.86)


puts "Creating products..."
tofu =Product.create!(name: "相模屋食料 絹 400g", description: "相模屋食料 絹 400g")
milk = Product.create!(name: "明治 おいしい牛乳 900ml", description: "明治 おいしい牛乳 900ml")
eggs = Product.create!(name: "クレスト たこたま 赤玉 10個入", description: "クレスト たこたま 赤玉 10個入")

Product.create!(name: "日清フーズ フラワー 薄力小麦粉 1kg", description: "日清フーズ フラワー 薄力小麦粉 1kg")
Product.create!(name: "はごろもフーズ シーチキンL 140g", description: "はごろもフーズ シーチキンL 140g")
Product.create!(name: "キッコーマン 特選丸大豆しょうゆ 1L", description: "キッコーマン 特選丸大豆しょうゆ 1L")
Product.create!(name: "味の素 ほんだし 120g", description: "味の素 ほんだし 120g")
Product.create!(name: "カゴメ トマトケチャップ 500g", description: "カゴメ トマトケチャップ 500g")
Product.create!(name: "ハウス バーモントカレー 甘口 230g", description: "ハウス バーモントカレー 甘口 230g")
Product.create!(name: "S&B ゴールデンカレー 中辛 198g", description: "S&B ゴールデンカレー 中辛 198g")
Product.create!(name: "永谷園 お茶づけ海苔 8袋入", description: "永谷園 お茶づけ海苔 8袋入")
Product.create!(name: "マルちゃん 赤いきつねうどん", description: "マルちゃん 赤いきつねうどん")
Product.create!(name: "サッポロ一番 しょうゆ味 5食パック", description: "サッポロ一番 しょうゆ味 5食パック")
Product.create!(name: "雪印メグミルク 6Pチーズ", description: "雪印メグミルク 6Pチーズ")
Product.create!(name: "森永 ビヒダス プレーンヨーグルト 400g", description: "森永 ビヒダス プレーンヨーグルト 400g")
Product.create!(name: "山崎製パン ダブルソフト 食パン", description: "山崎製パン ダブルソフト 食パン")
Product.create!(name: "Pasco 超熟 食パン 6枚切", description: "Pasco 超熟 食パン 6枚切")
Product.create!(name: "Calbee ポテトチップス うすしお味 60g", description: "Calbee ポテトチップス うすしお味 60g")
Product.create!(name: "ロッテ ガーナミルクチョコレート", description: "ロッテ ガーナミルクチョコレート")
Product.create!(name: "ネスレ キットカット 11枚入", description: "ネスレ キットカット 11枚入")
Product.create!(name: "コカ・コーラ 500ml", description: "コカ・コーラ 500ml")
Product.create!(name: "伊藤園 おーいお茶 緑茶 600ml", description: "伊藤園 おーいお茶 緑茶 600ml")
Product.create!(name: "サントリー 天然水 2L", description: "サントリー 天然水 2L")




puts "Creating prices..."
p1 = Price.create!(product: tofu, store: aeon, price_without_tax: 98, price_with_tax: 106)
p2 = Price.create!(product: tofu, store: life, price_without_tax: 88, price_with_tax: 95)
p3 = Price.create!(product: milk, store: aeon, price_without_tax: 198, price_with_tax: 213)
p4 = Price.create!(product: eggs, store: life, price_without_tax: 250, price_with_tax: 270)



# puts "Creating lists..."
# my_list = List.create!(name: "Weekly Grocery", user: user)

# puts "Adding items..."
# Item.create!(name: "Tofu", quantity: 2, list: my_list, price: p2, keyword: "tofu")
# Item.create!(name: "Milk", quantity: 1, list: my_list, price: p3, keyword: "milk")
# Item.create!(name: "Eggs", quantity: 1, list: my_list, price: p4, keyword: "egg")

# puts "Finished! Created #{User.count} user, #{Store.count} stores, #{Product.count} products, and #{List.count} list."
