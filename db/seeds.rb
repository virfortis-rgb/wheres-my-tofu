puts "Cleaning database..."
Item.destroy_all
List.destroy_all
Price.destroy_all
Product.destroy_all
Store.destroy_all


prices = [
  {
    "product": {
      "name": "タカノフーズ おかめ豆腐 絹美人 150g×3",
      "description": "タカノフーズ おかめ豆腐 絹美人 150g×3",
      "keyword": "tofu"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "男前豆腐店 特濃ケンちゃん 90g×3",
      "description": "男前豆腐店 特濃ケンちゃん 90g×3",
      "keyword": "tofu"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  },
  {
    "product": {
      "name": "明治 おいしい牛乳 900ml",
      "description": "明治 おいしい牛乳 900ml",
      "keyword": "milk"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "雪印メグミルク 北海道バター 200g",
      "description": "雪印メグミルク 北海道バター 200g",
      "keyword": "butter"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  },
  {
    "product": {
      "name": "サトウのごはん 新潟県産コシヒカリ 200g×5",
      "description": "サトウのごはん 新潟県産コシヒカリ 200g×5",
      "keyword": "rice"
    },
    "store": {
      "name": "イズミヤ 花園店",
      "address": "大阪府大阪市西成区花園北1丁目2-12",
      "latitude": 34.6421,
      "longitude": 135.4965
    }
  },
  {
    "product": {
      "name": "キッコーマン 特選丸大豆しょうゆ 500ml",
      "description": "キッコーマン 特選丸大豆しょうゆ 500ml",
      "keyword": "soy sauce"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "味の素 ほんだし 120g",
      "description": "味の素 ほんだし 120g",
      "keyword": "dashi"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  },
  {
    "product": {
      "name": "森永 アロエヨーグルト 118g",
      "description": "森永 アロエヨーグルト 118g",
      "keyword": "yogurt"
    },
    "store": {
      "name": "イズミヤ 花園店",
      "address": "大阪府大阪市西成区花園北1丁目2-12",
      "latitude": 34.6421,
      "longitude": 135.4965
    }
  },
  {
    "product": {
      "name": "プリマハム 香薫ウインナー 90g",
      "description": "プリマハム 香薫ウインナー 90g",
      "keyword": "sausage"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "山崎製パン ロイヤルブレッド 6枚切",
      "description": "山崎製パン ロイヤルブレッド 6枚切",
      "keyword": "bread"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  },
  {
    "product": {
      "name": "カルビー ポテトチップス うすしお味 60g",
      "description": "カルビー ポテトチップス うすしお味 60g",
      "keyword": "chips"
    },
    "store": {
      "name": "イズミヤ 花園店",
      "address": "大阪府大阪市西成区花園北1丁目2-12",
      "latitude": 34.6421,
      "longitude": 135.4965
    }
  },
  {
    "product": {
      "name": "伊藤園 おーいお茶 緑茶 600ml",
      "description": "伊藤園 おーいお茶 緑茶 600ml",
      "keyword": "tea"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "サントリー 天然水 2L",
      "description": "サントリー 天然水 2L",
      "keyword": "water"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  },
  {
    "product": {
      "name": "ネスカフェ ゴールドブレンド 80g",
      "description": "ネスカフェ ゴールドブレンド 80g",
      "keyword": "coffee"
    },
    "store": {
      "name": "イズミヤ 花園店",
      "address": "大阪府大阪市西成区花園北1丁目2-12",
      "latitude": 34.6421,
      "longitude": 135.4965
    }
  },
  {
    "product": {
      "name": "日清 カップヌードル 78g",
      "description": "日清 カップヌードル 78g",
      "keyword": "instant noodles"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "丸美屋 のりたま 25g",
      "description": "丸美屋 のりたま 25g",
      "keyword": "furikake"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  },
  {
    "product": {
      "name": "ハウス バーモントカレー 中辛 230g",
      "description": "ハウス バーモントカレー 中辛 230g",
      "keyword": "curry"
    },
    "store": {
      "name": "イズミヤ 花園店",
      "address": "大阪府大阪市西成区花園北1丁目2-12",
      "latitude": 34.6421,
      "longitude": 135.4965
    }
  },
  {
    "product": {
      "name": "トップバリュ たまご 10個入り",
      "description": "トップバリュ たまご 10個入り",
      "keyword": "eggs"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "北海道産 じゃがいも 1kg",
      "description": "北海道産 じゃがいも 1kg",
      "keyword": "potatoes"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  },
  {
    "product": {
      "name": "国産 豚こま切れ 300g",
      "description": "国産 豚こま切れ 300g",
      "keyword": "pork"
    },
    "store": {
      "name": "イズミヤ 花園店",
      "address": "大阪府大阪市西成区花園北1丁目2-12",
      "latitude": 34.6421,
      "longitude": 135.4965
    }
  },
  {
    "product": {
      "name": "フィリップモリス マールボロ 20本",
      "description": "フィリップモリス マールボロ 20本",
      "keyword": "cigarettes"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "ロッテ ガーナミルクチョコレート 50g",
      "description": "ロッテ ガーナミルクチョコレート 50g",
      "keyword": "chocolate"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  },
  {
    "product": {
      "name": "高知県産 ピーマン 1袋",
      "description": "高知県産 ピーマン 1袋",
      "keyword": "green pepper"
    },
    "store": {
      "name": "イズミヤ 花園店",
      "address": "大阪府大阪市西成区花園北1丁目2-12",
      "latitude": 34.6421,
      "longitude": 135.4965
    }
  },
  {
    "product": {
      "name": "宮崎県産 ジャンボピーマン 2個入り",
      "description": "宮崎県産 ジャンボピーマン 2個入り",
      "keyword": "green pepper"
    },
    "store": {
      "name": "イズミヤ 花園店",
      "address": "大阪府大阪市西成区花園北1丁目2-12",
      "latitude": 34.6421,
      "longitude": 135.4965
    }
  },

  {
    "product": {
      "name": "北海道産 玉ねぎ 1ネット(3個入り)",
      "description": "北海道産 玉ねぎ 1ネット(3個入り)",
      "keyword": "onion"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "兵庫県淡路島産 新玉ねぎ 2個入り",
      "description": "兵庫県淡路島産 新玉ねぎ 2個入り",
      "keyword": "onion"
    },
    "store": {
      "name": "スーパー玉出 天下茶屋店",
      "address": "大阪府大阪市西成区天下茶屋3丁目2-18",
      "latitude": 34.636,
      "longitude": 135.4948
    }
  },
  {
    "product": {
      "name": "国産 紫玉ねぎ (レッドオニオン) 1個",
      "description": "国産 紫玉ねぎ (レッドオニオン) 1個",
      "keyword": "onion"
    },
    "store": {
      "name": "ライフ 玉出東店",
      "address": "大阪府大阪市西成区玉出東1丁目7-31",
      "latitude": 34.6219,
      "longitude": 135.4923
    }
  }
]

prices.each_with_index do |price, index|
  product = Product.create!(name: price[:product][:name], description: price[:product][:description], keyword: price[:product][:keyword])
  store = Store.find_or_create_by!(name: price[:store][:name], address: price[:store][:address], latitude: price[:store][:latitude], longitude: price[:store][:longitude])
  random_price = rand(100..500)
  Price.create!(
    product: product,
    store: store,
    price_without_tax: random_price,
    price_with_tax: (random_price * 1.1).to_i
  )
  puts "Created #{index + 1} product(s)"
end
