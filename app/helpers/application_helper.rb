module ApplicationHelper
  # ORDER MATTERS — more specific/longer words must come before any shorter
  # word that is a substring of them (e.g. "eggplant" before "egg",
  # "pineapple" before "apple", "watermelon" before "water").
  GROCERY_EMOJIS = {
    # Vegetables — longer names first
    "eggplant"    => "🍆",
    "tofu"        => "🫘",
    "cabbage"     => "🥬",
    "lettuce"     => "🥬",
    "spinach"     => "🥬",
    "carrot"      => "🥕",
    "broccoli"    => "🥦",
    "onion"       => "🧅",
    "garlic"      => "🧄",
    "potato"      => "🥔",
    "tomato"      => "🍅",
    "cucumber"    => "🥒",
    "pepper"      => "🌶️",
    "corn"        => "🌽",
    "avocado"     => "🥑",
    "mushroom"    => "🍄",
    "ginger"      => "🫚",
    # Fruits — longer names first to avoid substring collisions
    "watermelon"  => "🍉",
    "strawberry"  => "🍓",
    "blueberry"   => "🫐",
    "pineapple"   => "🍍",
    "banana"      => "🍌",
    "orange"      => "🍊",
    "lemon"       => "🍋",
    "cherry"      => "🍒",
    "mango"       => "🥭",
    "grape"       => "🍇",
    "apple"       => "🍎",
    "peach"       => "🍑",
    "pear"        => "🍐",
    # Protein
    "chicken"     => "🍗",
    "shrimp"      => "🦐",
    "salmon"      => "🐟",
    "beef"        => "🥩",
    "pork"        => "🥩",
    "meat"        => "🥩",
    "fish"        => "🐟",
    "tuna"        => "🐟",
    "eggs"        => "🥚",
    # Dairy — "ice cream" before "cream"
    "ice cream"   => "🍦",
    "yogurt"      => "🥛",
    "cheese"      => "🧀",
    "butter"      => "🧈",
    "cream"       => "🥛",
    "milk"        => "🥛",
    # Grains & Carbs
    "noodle"      => "🍜",
    "pasta"       => "🍝",
    "bread"       => "🍞",
    "flour"       => "🌾",
    "rice"        => "🍚",
    "oat"         => "🌾",
    # Drinks — "watermelon" already handled above; "water" safe here
    "water"       => "💧",
    "coffee"      => "☕",
    "juice"       => "🧃",
    "cola"        => "🥤",
    "coke"        => "🥤",
    "soda"        => "🥤",
    "beer"        => "🍺",
    "wine"        => "🍷",
    "tea"         => "🍵",
    # Condiments & Pantry
    "ketchup"     => "🥫",
    "curry"       => "🍛",
    "dashi"       => "🍲",
    "peanut"      => "🥜",
    "honey"       => "🍯",
    "vinegar"     => "🫙",
    "sauce"       => "🫙",
    "salt"        => "🧂",
    "sugar"       => "🧂",
    "oil"         => "🫙",
    "soy"         => "🫙",
    # Snacks
    "chocolate"   => "🍫",
    "cookie"      => "🍪",
    "chips"       => "🥔",
    "nuts"        => "🥜",
    "cake"        => "🎂",
    "soup"        => "🍲",
  }.freeze

  def grocery_emoji(item)
    key = (item.keyword.presence || item.name).to_s.downcase.strip
    GROCERY_EMOJIS.find { |word, _| key.include?(word) }&.last || "🛒"
  end
end
