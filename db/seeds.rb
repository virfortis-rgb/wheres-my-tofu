puts "Cleaning database..."
Item.destroy_all
List.destroy_all
Price.destroy_all
Product.destroy_all
Store.destroy_all


prices = [
  {product: {
    name: "明治 おいしい牛乳 900ml",
    description: "明治 おいしい牛乳 900ml",
    keyword: "milk"
   },
  store: {
    name: "Ito Yokado Shinjuku",
    address: "1-1 Nishi-Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6905,
    longitude: 139.6992
   }
  },

  {product: {
    name: "雪印メグミルク 北海道バター 200g",
    description: "雪印メグミルク 北海道バター 200g",
    keyword: "butter"
   },
  store: {
    name: "Seiyu Shinjuku South",
    address: "2-3 Yoyogi, Shibuya-ku, Tokyo",
    latitude: 35.6882,
    longitude: 139.7005
   }
  },

  {product: {
    name: "サトウのごはん 新潟県産コシヒカリ 200g×5",
    description: "サトウのごはん 新潟県産コシヒカリ 200g×5",
    keyword: "rice"
   },
  store: {
    name: "Life Shinjuku East",
    address: "3-5 Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6893,
    longitude: 139.7038
   }
  },

  {product: {
    name: "キッコーマン 特選丸大豆しょうゆ 500ml",
    description: "キッコーマン 特選丸大豆しょうゆ 500ml",
    keyword: "soy sauce"
   },
  store: {
    name: "Maruetsu Shinjuku",
    address: "1-8 Kabukicho, Shinjuku-ku, Tokyo",
    latitude: 35.6925,
    longitude: 139.7018
   }
  },

  {product: {
    name: "味の素 ほんだし 120g",
    description: "味の素 ほんだし 120g",
    keyword: "dashi"
   },
  store: {
    name: "OK Store Shinjuku",
    address: "4-2 Nishi-Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6912,
    longitude: 139.6975
   }
  },

  {product: {
    name: "森永 アロエヨーグルト 118g",
    description: "森永 アロエヨーグルト 118g",
    keyword: "yogurt"
   },
  store: {
    name: "Summit Takashimaya Times Square",
    address: "5-24 Sendagaya, Shibuya-ku, Tokyo",
    latitude: 35.6877,
    longitude: 139.7025
   }
  },

  {product: {
    name: "プリマハム 香薫ウインナー 90g",
    description: "プリマハム 香薫ウインナー 90g",
    keyword: "sausage"
   },
  store: {
    name: "Inageya Shinjuku West",
    address: "2-6 Nishi-Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6918,
    longitude: 139.6963
   }
  },

  {product: {
    name: "山崎製パン ロイヤルブレッド 6枚切",
    description: "山崎製パン ロイヤルブレッド 6枚切",
    keyword: "bread"
   },
  store: {
    name: "York Foods Shinjuku",
    address: "2-10 Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6900,
    longitude: 139.7050
   }
  },

  {product: {
    name: "カルビー ポテトチップス うすしお味 60g",
    description: "カルビー ポテトチップス うすしお味 60g",
    keyword: "chips"
   },
  store: {
    name: "Don Quijote Shinjuku",
    address: "1-16 Kabukicho, Shinjuku-ku, Tokyo",
    latitude: 35.6932,
    longitude: 139.7007
   }
  },

  {product: {
    name: "伊藤園 おーいお茶 緑茶 600ml",
    description: "伊藤園 おーいお茶 緑茶 600ml",
    keyword: "tea"
   },
  store: {
    name: "My Basket Shinjuku-sanchome",
    address: "3-18 Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6888,
    longitude: 139.7062
   }
  },

  {product: {
    name: "サントリー 天然水 2L",
    description: "サントリー 天然水 2L",
    keyword: "water"
   },
  store: {
    name: "Hanamasa Shinjuku",
    address: "1-20 Nishi-Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6898,
    longitude: 139.6980
   }
  },

  {product: {
    name: "ネスカフェ ゴールドブレンド 80g",
    description: "ネスカフェ ゴールドブレンド 80g",
    keyword: "coffee"
   },
  store: {
    name: "Peacock Store Shinjuku",
    address: "5-10 Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6875,
    longitude: 139.7040
   }
  },

  {product: {
    name: "日清 カップヌードル 78g",
    description: "日清 カップヌードル 78g",
    keyword: "instant noodles"
   },
  store: {
    name: "Seijo Ishii Shinjuku South Gate",
    address: "1-1 Yoyogi, Shibuya-ku, Tokyo",
    latitude: 35.6868,
    longitude: 139.7013
   }
  },

  {product: {
    name: "丸美屋 のりたま 25g",
    description: "丸美屋 のりたま 25g",
    keyword: "furikake"
   },
  store: {
    name: "Olympic Shinjuku",
    address: "2-15 Nishi-Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6922,
    longitude: 139.6948
   }
  },

  {product: {
    name: "ハウス バーモントカレー 中辛 230g",
    description: "ハウス バーモントカレー 中辛 230g",
    keyword: "curry"
   },
  store: {
    name: "Yaoko Shinjuku",
    address: "4-1 Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6880,
    longitude: 139.7055
   }
  },

  {product: {
    name: "トップバリュ たまご 10個入り",
    description: "トップバリュ たまご 10個入り",
    keyword: "eggs"
   },
  store: {
    name: "AEON Shinjuku",
    address: "3-28 Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6910,
    longitude: 139.7030
   }
  },

  {product: {
    name: "北海道産 じゃがいも 1kg",
    description: "北海道産 じゃがいも 1kg",
    keyword: "potatoes"
   },
  store: {
    name: "Coop Shinjuku North",
    address: "2-5 Hyakunincho, Shinjuku-ku, Tokyo",
    latitude: 35.6940,
    longitude: 139.6995
   }
  },

  {product: {
    name: "国産 豚こま切れ 300g",
    description: "国産 豚こま切れ 300g",
    keyword: "pork"
   },
  store: {
    name: "Belc Shinjuku",
    address: "1-5 Okubo, Shinjuku-ku, Tokyo",
    latitude: 35.6935,
    longitude: 139.7028
   }
  },

  {product: {
    name: "フィリップモリス マールボロ 20本",
    description: "フィリップモリス マールボロ 20本",
    keyword: "cigarettes"
   },
  store: {
    name: "FamilyMart Shinjuku Higashi",
    address: "1-2 Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6895,
    longitude: 139.7022
   }
  },

  {product: {
    name: "ロッテ ガーナミルクチョコレート 50g",
    description: "ロッテ ガーナミルクチョコレート 50g",
    keyword: "chocolate"
   },
  store: {
    name: "Mini Stop Shinjuku",
    address: "6-8 Shinjuku, Shinjuku-ku, Tokyo",
    latitude: 35.6870,
    longitude: 139.7048
   }
  }
]

prices.each_with_index do |price, index|
  product = Product.create!(name: price[:product][:name], description: price[:product][:description], keyword: price[:product][:keyword])
  store = Store.create!(name: price[:store][:name], address: price[:store][:address], latitude: price[:store][:latitude], longitude: price[:store][:longitude])
  Price.create!(product: product, store: store, price_without_tax: 250, price_with_tax: 270)
  puts "Created #{index + 1} product(s)"
end
