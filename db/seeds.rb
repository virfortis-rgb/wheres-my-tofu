puts "Cleaning database..."
Item.destroy_all
List.destroy_all
Price.destroy_all
Product.destroy_all
Store.destroy_all

puts "Creating stores..."
aeon = Store.create!(name: "AEON Edogawa",  address: "Tokyo, Edogawa-ku, 123 Street",   latitude: 35.68, longitude: 139.85)
life = Store.create!(name: "Life Edogawa",  address: "Tokyo, Edogawa-ku, 456 Avenue",   latitude: 35.69, longitude: 139.86)
ito  = Store.create!(name: "Ito-Yokado",    address: "Tokyo, Koto-ku, 789 Boulevard",   latitude: 35.67, longitude: 139.84)
ok   = Store.create!(name: "OK Supermarket",address: "Tokyo, Sumida-ku, 321 Road",      latitude: 35.70, longitude: 139.83)

puts "Creating products..."

# ── Tofu ──────────────────────────────────────────────────────────────────────
tofu1  = Product.create!(name: "相模屋食料 絹ごし豆腐 400g",      description: "相模屋食料 絹ごし豆腐 400g",      keyword: "tofu")
tofu2  = Product.create!(name: "森永 絹ごし豆腐 300g",            description: "森永 絹ごし豆腐 300g",            keyword: "tofu")
tofu3  = Product.create!(name: "男前豆腐店 ジョニー 300g",        description: "男前豆腐店 ジョニー 300g",        keyword: "tofu")

# ── Milk ──────────────────────────────────────────────────────────────────────
milk1  = Product.create!(name: "明治 おいしい牛乳 900ml",          description: "明治 おいしい牛乳 900ml",          keyword: "milk")
milk2  = Product.create!(name: "森永 おいしい低脂肪乳 900ml",      description: "森永 おいしい低脂肪乳 900ml",      keyword: "milk")
milk3  = Product.create!(name: "雪印メグミルク 牛乳 1L",           description: "雪印メグミルク 牛乳 1L",           keyword: "milk")

# ── Eggs ──────────────────────────────────────────────────────────────────────
egg1   = Product.create!(name: "クレスト たこたま 赤玉 10個入",    description: "クレスト たこたま 赤玉 10個入",    keyword: "egg")
egg2   = Product.create!(name: "ＭＳ白卵 Ｍサイズ 10個入",         description: "ＭＳ白卵 Ｍサイズ 10個入",         keyword: "egg")
egg3   = Product.create!(name: "イセデリカ 朝採れたまご 6個",      description: "イセデリカ 朝採れたまご 6個",      keyword: "egg")

# ── Rice ──────────────────────────────────────────────────────────────────────
rice1  = Product.create!(name: "魚沼産コシヒカリ 5kg",             description: "魚沼産コシヒカリ 5kg",             keyword: "rice")
rice2  = Product.create!(name: "あきたこまち 無洗米 5kg",          description: "あきたこまち 無洗米 5kg",          keyword: "rice")
rice3  = Product.create!(name: "ゆめぴりか 2kg",                  description: "ゆめぴりか 2kg",                  keyword: "rice")

# ── Bread ─────────────────────────────────────────────────────────────────────
bread1 = Product.create!(name: "山崎製パン ダブルソフト 食パン",   description: "山崎製パン ダブルソフト 食パン",   keyword: "bread")
bread2 = Product.create!(name: "Pasco 超熟 食パン 6枚切",          description: "Pasco 超熟 食パン 6枚切",          keyword: "bread")
bread3 = Product.create!(name: "フジパン 本仕込 食パン 6枚切",     description: "フジパン 本仕込 食パン 6枚切",     keyword: "bread")

# ── Noodles ───────────────────────────────────────────────────────────────────
noodle1 = Product.create!(name: "マルちゃん 赤いきつねうどん",     description: "マルちゃん 赤いきつねうどん",     keyword: "noodle")
noodle2 = Product.create!(name: "サッポロ一番 しょうゆ味 5食",     description: "サッポロ一番 しょうゆ味 5食",     keyword: "noodle")
noodle3 = Product.create!(name: "日清 チキンラーメン 5食パック",   description: "日清 チキンラーメン 5食パック",   keyword: "noodle")
noodle4 = Product.create!(name: "東洋水産 焼そば 3食パック",       description: "東洋水産 焼そば 3食パック",       keyword: "noodle")

# ── Chicken ───────────────────────────────────────────────────────────────────
chick1 = Product.create!(name: "国産 鶏むね肉 100g",               description: "国産 鶏むね肉 100g",               keyword: "chicken")
chick2 = Product.create!(name: "若鶏もも肉 250g",                  description: "若鶏もも肉 250g",                  keyword: "chicken")

# ── Pork ──────────────────────────────────────────────────────────────────────
pork1  = Product.create!(name: "国産 豚バラ薄切り 200g",           description: "国産 豚バラ薄切り 200g",           keyword: "pork")
pork2  = Product.create!(name: "豚ロース 生姜焼き用 200g",         description: "豚ロース 生姜焼き用 200g",         keyword: "pork")

# ── Beef ──────────────────────────────────────────────────────────────────────
beef1  = Product.create!(name: "国産 牛切り落とし 200g",           description: "国産 牛切り落とし 200g",           keyword: "beef")
beef2  = Product.create!(name: "オーストラリア産 牛ひき肉 200g",   description: "オーストラリア産 牛ひき肉 200g",   keyword: "beef")

# ── Fish & Seafood ────────────────────────────────────────────────────────────
tuna1  = Product.create!(name: "はごろもフーズ シーチキンL 140g",  description: "はごろもフーズ シーチキンL 140g",  keyword: "tuna")
tuna2  = Product.create!(name: "いなば ライトツナ 70g×3缶",        description: "いなば ライトツナ 70g×3缶",        keyword: "tuna")
salmon1= Product.create!(name: "塩銀鮭 甘口 2切",                  description: "塩銀鮭 甘口 2切",                  keyword: "salmon")
shrimp1= Product.create!(name: "バナメイえび 冷凍 200g",           description: "バナメイえび 冷凍 200g",           keyword: "shrimp")

# ── Vegetables ────────────────────────────────────────────────────────────────
carrot1  = Product.create!(name: "国産 にんじん 3本入",            description: "国産 にんじん 3本入",            keyword: "carrot")
onion1   = Product.create!(name: "北海道産 たまねぎ 3個",          description: "北海道産 たまねぎ 3個",          keyword: "onion")
potato1  = Product.create!(name: "北海道産 じゃがいも 4個",        description: "北海道産 じゃがいも 4個",        keyword: "potato")
tomato1  = Product.create!(name: "国産 トマト 4個入",              description: "国産 トマト 4個入",              keyword: "tomato")
cabbage1 = Product.create!(name: "国産 キャベツ 1玉",              description: "国産 キャベツ 1玉",              keyword: "cabbage")
spinach1 = Product.create!(name: "国産 ほうれん草 1束",            description: "国産 ほうれん草 1束",            keyword: "spinach")
broc1    = Product.create!(name: "国産 ブロッコリー 1株",          description: "国産 ブロッコリー 1株",          keyword: "broccoli")
cucumber1= Product.create!(name: "国産 きゅうり 3本",              description: "国産 きゅうり 3本",              keyword: "cucumber")
mushroom1= Product.create!(name: "しめじ 1パック",                 description: "しめじ 1パック",                 keyword: "mushroom")
mushroom2= Product.create!(name: "エリンギ 1パック",               description: "エリンギ 1パック",               keyword: "mushroom")
garlic1  = Product.create!(name: "青森産 にんにく 1玉",            description: "青森産 にんにく 1玉",            keyword: "garlic")
ginger1  = Product.create!(name: "国産 しょうが 1袋",              description: "国産 しょうが 1袋",              keyword: "ginger")

# ── Fruit ─────────────────────────────────────────────────────────────────────
apple1   = Product.create!(name: "青森産 ふじりんご 3個",          description: "青森産 ふじりんご 3個",          keyword: "apple")
banana1  = Product.create!(name: "フィリピン産 バナナ 1房",        description: "フィリピン産 バナナ 1房",        keyword: "banana")
orange1  = Product.create!(name: "愛媛産 みかん 5個",              description: "愛媛産 みかん 5個",              keyword: "orange")
lemon1   = Product.create!(name: "国産 レモン 3個",                description: "国産 レモン 3個",                keyword: "lemon")

# ── Dairy ─────────────────────────────────────────────────────────────────────
cheese1  = Product.create!(name: "雪印メグミルク 6Pチーズ",        description: "雪印メグミルク 6Pチーズ",        keyword: "cheese")
cheese2  = Product.create!(name: "明治 北海道十勝スライスチーズ",  description: "明治 北海道十勝スライスチーズ",  keyword: "cheese")
yogurt1  = Product.create!(name: "森永 ビヒダス プレーンヨーグルト 400g", description: "森永 ビヒダス プレーンヨーグルト 400g", keyword: "yogurt")
yogurt2  = Product.create!(name: "明治 ブルガリアヨーグルト 400g", description: "明治 ブルガリアヨーグルト 400g", keyword: "yogurt")
butter1  = Product.create!(name: "よつ葉バター 有塩 200g",         description: "よつ葉バター 有塩 200g",         keyword: "butter")
cream1   = Product.create!(name: "中沢 生クリーム 200ml",          description: "中沢 生クリーム 200ml",          keyword: "cream")

# ── Pantry ────────────────────────────────────────────────────────────────────
soy1     = Product.create!(name: "キッコーマン 特選丸大豆しょうゆ 1L",  description: "キッコーマン 特選丸大豆しょうゆ 1L",  keyword: "soy")
soy2     = Product.create!(name: "ヤマサ醤油 昆布つゆ 500ml",           description: "ヤマサ醤油 昆布つゆ 500ml",           keyword: "soy")
dashi1   = Product.create!(name: "味の素 ほんだし 120g",                description: "味の素 ほんだし 120g",                keyword: "dashi")
dashi2   = Product.create!(name: "茅乃舎 だしパック 8袋入",             description: "茅乃舎 だしパック 8袋入",             keyword: "dashi")
ketchup1 = Product.create!(name: "カゴメ トマトケチャップ 500g",         description: "カゴメ トマトケチャップ 500g",         keyword: "ketchup")
curry1   = Product.create!(name: "ハウス バーモントカレー 甘口 230g",    description: "ハウス バーモントカレー 甘口 230g",    keyword: "curry")
curry2   = Product.create!(name: "S&B ゴールデンカレー 中辛 198g",      description: "S&B ゴールデンカレー 中辛 198g",      keyword: "curry")
flour1   = Product.create!(name: "日清フーズ フラワー 薄力小麦粉 1kg",  description: "日清フーズ フラワー 薄力小麦粉 1kg",  keyword: "flour")
oil1     = Product.create!(name: "日清 サラダ油 900g",                   description: "日清 サラダ油 900g",                   keyword: "oil")
oil2     = Product.create!(name: "オリーブオイル エキストラバージン 250ml", description: "オリーブオイル エキストラバージン 250ml", keyword: "oil")
salt1    = Product.create!(name: "伯方の塩 粗塩 1kg",                    description: "伯方の塩 粗塩 1kg",                    keyword: "salt")
sugar1   = Product.create!(name: "上白糖 1kg",                           description: "上白糖 1kg",                           keyword: "sugar")
vinegar1 = Product.create!(name: "ミツカン 穀物酢 500ml",                description: "ミツカン 穀物酢 500ml",                keyword: "vinegar")
honey1   = Product.create!(name: "アカシアはちみつ 300g",                description: "アカシアはちみつ 300g",                keyword: "honey")

# ── Drinks ────────────────────────────────────────────────────────────────────
water1   = Product.create!(name: "サントリー 天然水 2L",                 description: "サントリー 天然水 2L",                 keyword: "water")
water2   = Product.create!(name: "いろはす 天然水 540ml×24本",           description: "いろはす 天然水 540ml×24本",           keyword: "water")
tea1     = Product.create!(name: "伊藤園 おーいお茶 緑茶 600ml",         description: "伊藤園 おーいお茶 緑茶 600ml",         keyword: "tea")
tea2     = Product.create!(name: "サントリー 烏龍茶 500ml",              description: "サントリー 烏龍茶 500ml",              keyword: "tea")
coffee1  = Product.create!(name: "ジョージア エメラルドマウンテン 185g缶", description: "ジョージア エメラルドマウンテン 185g缶", keyword: "coffee")
coffee2  = Product.create!(name: "UCC ブラック無糖 185g缶",              description: "UCC ブラック無糖 185g缶",              keyword: "coffee")
cola1    = Product.create!(name: "コカ・コーラ 500ml",                   description: "コカ・コーラ 500ml",                   keyword: "soda")
cola2    = Product.create!(name: "三ツ矢サイダー 500ml",                 description: "三ツ矢サイダー 500ml",                 keyword: "soda")
juice1   = Product.create!(name: "カゴメ 野菜生活 200ml",                description: "カゴメ 野菜生活 200ml",                keyword: "juice")
beer1    = Product.create!(name: "アサヒ スーパードライ 350ml缶",         description: "アサヒ スーパードライ 350ml缶",         keyword: "beer")
beer2    = Product.create!(name: "キリン 一番搾り 350ml缶",              description: "キリン 一番搾り 350ml缶",              keyword: "beer")

# ── Snacks ────────────────────────────────────────────────────────────────────
chips1   = Product.create!(name: "Calbee ポテトチップス うすしお 60g",   description: "Calbee ポテトチップス うすしお 60g",   keyword: "chips")
chips2   = Product.create!(name: "湖池屋 プライドポテト 55g",            description: "湖池屋 プライドポテト 55g",            keyword: "chips")
choco1   = Product.create!(name: "ロッテ ガーナミルクチョコレート 86g",  description: "ロッテ ガーナミルクチョコレート 86g",  keyword: "chocolate")
choco2   = Product.create!(name: "ネスレ キットカット ミニ 13枚",        description: "ネスレ キットカット ミニ 13枚",        keyword: "chocolate")
cookie1  = Product.create!(name: "ブルボン アルフォート 12枚",           description: "ブルボン アルフォート 12枚",           keyword: "cookie")
nuts1    = Product.create!(name: "カルビー じゃがビー うすしお 38g",     description: "カルビー じゃがビー うすしお 38g",     keyword: "nuts")

puts "Creating prices..."

# helper to create prices at all stores with slight variation
def prices_at(product, stores, base_without, base_with)
  stores.each_with_index do |(store, offset_w, offset_t), _|
    Price.create!(product: product, store: store,
                  price_without_tax: base_without + offset_w,
                  price_with_tax:    base_with    + offset_t)
  end
end

[[tofu1,    [[aeon,  0,  0], [life, -10, -11], [ok,  -5,  -6]]],
 [tofu2,    [[ito,   0,  0], [life,   5,   5]]],
 [tofu3,    [[aeon,  8,  9], [ok,    -3,  -3]]],
 [milk1,    [[aeon,  0,  0], [life, -10, -10], [ito, -20, -21]]],
 [milk2,    [[ok,    0,  0], [life,   5,   6]]],
 [milk3,    [[aeon, 10, 11], [ito,    0,   0]]],
 [egg1,     [[life,  0,  0], [aeon,  18,  19], [ok,   -8,  -9]]],
 [egg2,     [[ito,   0,  0], [ok,   -12, -13]]],
 [egg3,     [[aeon, 20, 22], [life,  10,  11]]],
 [rice1,    [[aeon,  0,  0], [life, -50, -54], [ito,  30,  32]]],
 [rice2,    [[ok,    0,  0], [aeon,  20,  21]]],
 [rice3,    [[life,  0,  0], [ito,  -30, -32]]],
 [bread1,   [[aeon,  0,  0], [life, -10, -11], [ok,  -20, -21]]],
 [bread2,   [[ito,   0,  0], [ok,   -10, -11]]],
 [bread3,   [[life,  0,  0], [aeon,  10,  11]]],
 [noodle1,  [[aeon,  0,  0], [ok,   -10, -11]]],
 [noodle2,  [[life,  0,  0], [ito,  -20, -21], [aeon, 10,  11]]],
 [noodle3,  [[ok,    0,  0], [life,  10,  11]]],
 [noodle4,  [[aeon,  0,  0], [ito,  -15, -16]]],
 [chick1,   [[aeon,  0,  0], [life, -20, -21], [ok,  -30, -32]]],
 [chick2,   [[ito,   0,  0], [ok,   -25, -27]]],
 [pork1,    [[aeon,  0,  0], [life, -15, -16], [ito,  10,  11]]],
 [pork2,    [[ok,    0,  0], [aeon,  20,  21]]],
 [beef1,    [[aeon,  0,  0], [ok,   -30, -32]]],
 [beef2,    [[life,  0,  0], [ito,  -20, -21]]],
 [tuna1,    [[aeon,  0,  0], [ito,  -10, -11]]],
 [tuna2,    [[life,  0,  0], [ok,   -15, -16], [aeon,  5,   5]]],
 [salmon1,  [[aeon,  0,  0], [life,  20,  21], [ok,   -10, -11]]],
 [shrimp1,  [[ito,   0,  0], [ok,   -30, -32]]],
 [carrot1,  [[aeon,  0,  0], [life,  -5,  -5], [ok,   -10, -11]]],
 [onion1,   [[aeon,  0,  0], [ito,   -8,  -9], [ok,   -15, -16]]],
 [potato1,  [[life,  0,  0], [aeon,  10,  11], [ok,    -5,  -5]]],
 [tomato1,  [[aeon,  0,  0], [life,  -8,  -9]]],
 [cabbage1, [[ok,    0,  0], [aeon,  15,  16]]],
 [spinach1, [[life,  0,  0], [ito,   10,  11]]],
 [broc1,    [[aeon,  0,  0], [ok,   -10, -11]]],
 [cucumber1,[[life,  0,  0], [aeon,   5,   5]]],
 [mushroom1,[[aeon,  0,  0], [ok,   -10, -11], [life,  -5,  -5]]],
 [mushroom2,[[ito,   0,  0], [aeon,  10,  11]]],
 [garlic1,  [[aeon,  0,  0], [ok,   -15, -16]]],
 [ginger1,  [[life,  0,  0], [aeon,  10,  11]]],
 [apple1,   [[aeon,  0,  0], [ok,   -20, -21]]],
 [banana1,  [[life,  0,  0], [ito,   -8,  -9], [aeon,  10,  11]]],
 [orange1,  [[ok,    0,  0], [aeon,  15,  16]]],
 [lemon1,   [[life,  0,  0], [ito,   10,  11]]],
 [cheese1,  [[aeon,  0,  0], [life, -20, -21]]],
 [cheese2,  [[ito,   0,  0], [ok,   -30, -32], [aeon,  10,  11]]],
 [yogurt1,  [[aeon,  0,  0], [ito,  -10, -11]]],
 [yogurt2,  [[life,  0,  0], [ok,   -15, -16]]],
 [butter1,  [[aeon,  0,  0], [ok,   -20, -21]]],
 [cream1,   [[life,  0,  0], [aeon,  10,  11]]],
 [soy1,     [[aeon,  0,  0], [life, -20, -21]]],
 [soy2,     [[ito,   0,  0], [ok,   -15, -16]]],
 [dashi1,   [[life,  0,  0], [aeon,  10,  11]]],
 [dashi2,   [[ok,    0,  0], [ito,   30,  32]]],
 [ketchup1, [[ito,   0,  0], [aeon,  10,  11], [ok,    -5,  -5]]],
 [curry1,   [[aeon,  0,  0], [life, -20, -21]]],
 [curry2,   [[life,  0,  0], [ito,  -10, -11], [ok,   -20, -21]]],
 [flour1,   [[aeon,  0,  0], [ok,   -10, -11]]],
 [oil1,     [[aeon,  0,  0], [life, -20, -21], [ok,   -30, -32]]],
 [oil2,     [[ito,   0,  0], [ok,   -40, -43]]],
 [salt1,    [[aeon,  0,  0], [life,  -5,  -5]]],
 [sugar1,   [[ok,    0,  0], [aeon,  10,  11]]],
 [vinegar1, [[life,  0,  0], [ito,  -10, -11]]],
 [honey1,   [[aeon,  0,  0], [ok,   -20, -21]]],
 [water1,   [[aeon,  0,  0], [life, -10, -11], [ito,   -6,  -7]]],
 [water2,   [[ok,    0,  0], [aeon,  20,  21]]],
 [tea1,     [[aeon,  0,  0], [life,  -5,  -5], [ok,   -10, -11]]],
 [tea2,     [[ito,   0,  0], [ok,    -5,  -5]]],
 [coffee1,  [[aeon,  0,  0], [ok,    -5,  -5]]],
 [coffee2,  [[life,  0,  0], [ito,   -8,  -9]]],
 [cola1,    [[aeon,  0,  0], [ito,  -10, -11]]],
 [cola2,    [[life,  0,  0], [ok,    -5,  -5]]],
 [juice1,   [[aeon,  0,  0], [life,  -8,  -9]]],
 [beer1,    [[aeon,  0,  0], [ok,   -10, -11]]],
 [beer2,    [[life,  0,  0], [ito,  -15, -16]]],
 [chips1,   [[aeon,  0,  0], [ito,  -10, -11]]],
 [chips2,   [[ok,    0,  0], [life, -15, -16]]],
 [choco1,   [[aeon,  0,  0], [life, -15, -16]]],
 [choco2,   [[ok,    0,  0], [ito,  -20, -21]]],
 [cookie1,  [[aeon,  0,  0], [ok,   -10, -11]]],
 [nuts1,    [[life,  0,  0], [aeon,  10,  11]]],
].each do |product, store_configs|
  base_prices = {
    tofu1 => [98, 106], tofu2 => [92, 99], tofu3 => [105, 113],
    milk1 => [198, 213], milk2 => [178, 192], milk3 => [188, 203],
    egg1 => [250, 270], egg2 => [238, 257], egg3 => [268, 289],
    rice1 => [1480, 1598], rice2 => [1280, 1382], rice3 => [980, 1058],
    bread1 => [158, 170], bread2 => [138, 149], bread3 => [148, 159],
    noodle1 => [128, 138], noodle2 => [298, 321], noodle3 => [198, 213], noodle4 => [248, 267],
    chick1 => [158, 170], chick2 => [188, 203],
    pork1 => [248, 267], pork2 => [268, 289],
    beef1 => [348, 375], beef2 => [298, 321],
    tuna1 => [148, 159], tuna2 => [198, 213],
    salmon1 => [298, 321], shrimp1 => [348, 375],
    carrot1 => [98, 106], onion1 => [128, 138], potato1 => [148, 159],
    tomato1 => [198, 213], cabbage1 => [158, 170], spinach1 => [128, 138],
    broc1 => [148, 159], cucumber1 => [98, 106],
    mushroom1 => [128, 138], mushroom2 => [148, 159],
    garlic1 => [98, 106], ginger1 => [88, 95],
    apple1 => [298, 321], banana1 => [178, 192], orange1 => [248, 267], lemon1 => [128, 138],
    cheese1 => [298, 321], cheese2 => [348, 375],
    yogurt1 => [178, 192], yogurt2 => [168, 181],
    butter1 => [398, 429], cream1 => [248, 267],
    soy1 => [348, 375], soy2 => [248, 267],
    dashi1 => [248, 267], dashi2 => [498, 537],
    ketchup1 => [198, 213], curry1 => [268, 289], curry2 => [248, 267],
    flour1 => [188, 203], oil1 => [298, 321], oil2 => [698, 753],
    salt1 => [148, 159], sugar1 => [198, 213], vinegar1 => [178, 192], honey1 => [498, 537],
    water1 => [88, 95], water2 => [498, 537],
    tea1 => [128, 138], tea2 => [118, 127],
    coffee1 => [98, 106], coffee2 => [88, 95],
    cola1 => [98, 106], cola2 => [108, 116], juice1 => [128, 138],
    beer1 => [198, 213], beer2 => [188, 203],
    chips1 => [128, 138], chips2 => [148, 159],
    choco1 => [178, 192], choco2 => [198, 213],
    cookie1 => [158, 170], nuts1 => [148, 159],
  }

  bw, bt = base_prices[product]
  store_configs.each do |store, offset_w, offset_t|
    Price.create!(product: product, store: store,
                  price_without_tax: bw + offset_w,
                  price_with_tax:    bt + offset_t)
  end
end

puts "Done! #{Store.count} stores, #{Product.count} products, #{Price.count} prices."
