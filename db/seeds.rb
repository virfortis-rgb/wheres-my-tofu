puts "Cleaning database..."
Item.destroy_all
List.destroy_all
Price.destroy_all
Product.destroy_all
Store.destroy_all

# prices = [
#   {product: {
#     name: "日清フーズ フラワー 薄力小麦粉 1kg",
#     description: "日清フーズ フラワー 薄力小麦粉 1kg"
#     },
#   store: {
#     name: "AEON Edogawa",
#     address: "Tokyo, Edogawa-ku, 123 Street",
#     latitude: 35.68,
#     longitude: 139.85
#     }
#   }
# ]

prices = [
  {product: {
    name: "明治 おいしい牛乳 900ml",
    description: "明治 おいしい牛乳 900ml",
    keyword: "milk"
   },
  store: {
    name: "Ito Yokado Kameari",
    address: "Tokyo, Katsushika-ku, 456 Street",
    latitude: 35.77,
    longitude: 139.85
   }
  },

  {product: {
    name: "雪印メグミルク 北海道バター 200g",
    description: "雪印メグミルク 北海道バター 200g",
    keyword: "butter"
   },
  store: {
    name: "Seiyu Shinjuku",
    address: "Tokyo, Shinjuku-ku, 789 Street",
    latitude: 35.69,
    longitude: 139.70
   }
  },

  {product: {
    name: "サトウのごはん 新潟県産コシヒカリ 200g×5",
    description: "サトウのごはん 新潟県産コシヒカリ 200g×5",
    keyword: "rice"
   },
  store: {
    name: "Life Setagaya",
    address: "Tokyo, Setagaya-ku, 321 Street",
    latitude: 35.65,
    longitude: 139.65
   }
  },

  {product: {
    name: "キッコーマン 特選丸大豆しょうゆ 500ml",
    description: "キッコーマン 特選丸大豆しょうゆ 500ml",
    keyword: "soy sauce"
   },
  store: {
    name: "Maruetsu Nakano",
    address: "Tokyo, Nakano-ku, 654 Street",
    latitude: 35.71,
    longitude: 139.66
   }
  },

  {product: {
    name: "味の素 ほんだし 120g",
    description: "味の素 ほんだし 120g",
    keyword: "dashi"
   },
  store: {
    name: "OK Store Machida",
    address: "Tokyo, Machida, 987 Street",
    latitude: 35.54,
    longitude: 139.45
   }
  },

  {product: {
    name: "森永 アロエヨーグルト 118g",
    description: "森永 アロエヨーグルト 118g",
    keyword: "yogurt"
   },
  store: {
    name: "Summit Shinagawa",
    address: "Tokyo, Shinagawa-ku, 159 Street",
    latitude: 35.62,
    longitude: 139.73
   }
  },

  {product: {
    name: "プリマハム 香薫ウインナー 90g",
    description: "プリマハム 香薫ウインナー 90g",
    keyword: "sausage"
   },
  store: {
    name: "Inageya Mitaka",
    address: "Tokyo, Mitaka, 753 Street",
    latitude: 35.68,
    longitude: 139.56
   }
  },

  {product: {
    name: "山崎製パン ロイヤルブレッド 6枚切",
    description: "山崎製パン ロイヤルブレッド 6枚切",
    keyword: "bread"
   },
  store: {
    name: "York Foods Kiba",
    address: "Tokyo, Koto-ku, 852 Street",
    latitude: 35.67,
    longitude: 139.80
   }
  },

  {product: {
    name: "カルビー ポテトチップス うすしお味 60g",
    description: "カルビー ポテトチップス うすしお味 60g",
    keyword: "chips"
   },
  store: {
    name: "Don Quijote Akihabara",
    address: "Tokyo, Chiyoda-ku, 951 Street",
    latitude: 35.70,
    longitude: 139.77
   }
  },

  {product: {
    name: "伊藤園 おーいお茶 緑茶 600ml",
    description: "伊藤園 おーいお茶 緑茶 600ml",
    keyword: "tea"
   },
  store: {
    name: "My Basket Ueno",
    address: "Tokyo, Taito-ku, 357 Street",
    latitude: 35.71,
    longitude: 139.78
   }
  },

  {product: {
    name: "サントリー 天然水 2L",
    description: "サントリー 天然水 2L",
    keyword: "water"
   },
  store: {
    name: "Hanamasa Shibuya",
    address: "Tokyo, Shibuya-ku, 258 Street",
    latitude: 35.66,
    longitude: 139.70
   }
  },

  {product: {
    name: "ネスカフェ ゴールドブレンド 80g",
    description: "ネスカフェ ゴールドブレンド 80g",
    keyword: "coffee"
   },
  store: {
    name: "Peacock Store Ebisu",
    address: "Tokyo, Shibuya-ku, 147 Street",
    latitude: 35.65,
    longitude: 139.71
   }
  },

  {product: {
    name: "日清 カップヌードル 78g",
    description: "日清 カップヌードル 78g",
    keyword: "instant noodles"
   },
  store: {
    name: "Seijo Ishii Futako",
    address: "Tokyo, Setagaya-ku, 369 Street",
    latitude: 35.61,
    longitude: 139.63
   }
  },

  {product: {
    name: "丸美屋 のりたま 25g",
    description: "丸美屋 のりたま 25g",
    keyword: "furikake"
   },
  store: {
    name: "Olympic Tachikawa",
    address: "Tokyo, Tachikawa, 789 Street",
    latitude: 35.70,
    longitude: 139.41
   }
  },

  {product: {
    name: "ハウス バーモントカレー 中辛 230g",
    description: "ハウス バーモントカレー 中辛 230g",
    keyword: "curry"
   },
  store: {
    name: "Yaoko Higashimurayama",
    address: "Tokyo, Higashimurayama, 456 Street",
    latitude: 35.75,
    longitude: 139.47
   }
  },

  {product: {
    name: "トップバリュ たまご 10個入り",
    description: "トップバリュ たまご 10個入り",
    keyword: "eggs"
   },
  store: {
    name: "AEON Shinagawa Seaside",
    address: "Tokyo, Shinagawa-ku, 852 Street",
    latitude: 35.61,
    longitude: 139.75
   }
  },

  {product: {
    name: "北海道産 じゃがいも 1kg",
    description: "北海道産 じゃがいも 1kg",
    keyword: "potatoes"
   },
  store: {
    name: "Coop Nerima",
    address: "Tokyo, Nerima-ku, 741 Street",
    latitude: 35.74,
    longitude: 139.65
   }
  },

  {product: {
    name: "国産 豚こま切れ 300g",
    description: "国産 豚こま切れ 300g",
    keyword: "pork"
   },
  store: {
    name: "Belc Adachi",
    address: "Tokyo, Adachi-ku, 963 Street",
    latitude: 35.78,
    longitude: 139.80
   }
  },

  {product: {
    name: "フィリップモリス マールボロ 20本",
    description: "フィリップモリス マールボロ 20本",
    keyword: "cigarettes"
   },
  store: {
    name: "FamilyMart Ikebukuro",
    address: "Tokyo, Toshima-ku, 258 Street",
    latitude: 35.73,
    longitude: 139.71
   }
  },

  {product: {
    name: "ロッテ ガーナミルクチョコレート 50g",
    description: "ロッテ ガーナミルクチョコレート 50g",
    keyword: "chocolate"
   },
  store: {
    name: "Mini Stop Odaiba",
    address: "Tokyo, Minato-ku, 159 Street",
    latitude: 35.63,
    longitude: 139.78
   }
  }
]

prices.each_with_index do |price, index|
  product = Product.create!(name: price[:product][:name], description: price[:product][:description])
  store = Store.create!(name: price[:store][:name], address: price[:store][:address], latitude: price[:store][:latitude], longitude: price[:store][:longitude])
  Price.create!(product: product, store: store, price_without_tax: 250, price_with_tax: 270)
  puts "Created #{index + 1 } product(s)"
end
