module GroceryIconHelper
  # Maps keywords → SVG filenames (without .svg extension).
  # Order matters: more specific terms before generic ones.
  # e.g. "mince" is listed before "beef" so "beef mince" matches "mince" first.
  # To add a new icon: drop the SVG in app/assets/images/grocery-icons/
  # and add one line here.
  ICON_MAP = {
    # ── Meat & Poultry ───────────────────────────────────────────
    "mince"       => "mince",
    "chicken"     => "chicken",
    "beef"        => "beef",
    "pork"        => "pork",
    "lamb"        => "lamb",
    "sausage"     => "sausage",
    "bacon"       => "bacon",
    "ham"         => "ham",
    # ── Seafood ──────────────────────────────────────────────────
    "salmon"      => "salmon",
    "tuna"        => "tuna",
    "shrimp"      => "shrimp",
    "prawn"       => "shrimp",
    "crab"        => "crab",
    "fish"        => "fish",
    # ── Vegetables ───────────────────────────────────────────────
    "carrot"      => "carrot",
    "broccoli"    => "broccoli",
    "potato"      => "potato",
    "onion"       => "onion",
    "garlic"      => "garlic",
    "tomato"      => "tomato",
    "cucumber"    => "cucumber",
    "spinach"     => "spinach",
    "mushroom"    => "mushroom",
    "corn"        => "corn",
    "pepper"      => "pepper",
    # ── Fruit ────────────────────────────────────────────────────
    "strawberry"  => "strawberry",
    "watermelon"  => "watermelon",
    "banana"      => "banana",
    "orange"      => "orange",
    "grape"       => "grape",
    "lemon"       => "lemon",
    "mango"       => "mango",
    "apple"       => "apple",
    # ── Dairy ────────────────────────────────────────────────────
    "yogurt"      => "yogurt",
    "butter"      => "butter",
    "cheese"      => "cheese",
    "cream"       => "cream",
    "milk"        => "milk",
    "eggs"        => "egg",
    # ── Bakery ───────────────────────────────────────────────────
    "bread"       => "bread",
    "cookie"      => "cookie",
    "cake"        => "cake",
    # ── Drinks ───────────────────────────────────────────────────
    "coffee"      => "coffee",
    "juice"       => "juice",
    "water"       => "water",
    "beer"        => "beer",
    "wine"        => "wine",
    "tea"         => "tea",
    # ── Pantry ───────────────────────────────────────────────────
    "noodle"      => "noodle",
    "pasta"       => "pasta",
    "tofu"        => "tofu",
    "soy sauce"   => "soy_sauce",
    "rice"        => "rice",
    "sugar"       => "sugar",
    "salt"        => "salt",
    "oil"         => "oil",
  }.freeze

  # Returns the icon filename (without extension) for a given product name.
  # Falls back to "grocery" if no keyword matches.
  def grocery_icon_for(product_name)
    return "grocery" if product_name.blank?

    normalized = product_name.to_s.downcase
    match = ICON_MAP.find { |keyword, _| normalized.include?(keyword) }
    match ? match[1] : "grocery"
  end

  # Returns an <img> tag for the matching grocery SVG icon.
  # Falls back to grocery.svg automatically if the specific file is missing
  # (handled by the browser's natural 404 → onerror behaviour in the view).
  def grocery_icon_tag(product_name, size: 28)
    icon = grocery_icon_for(product_name)
    image_tag "grocery-icons/#{icon}.png",
              alt:    icon.humanize,
              width:  size,
              height: size,
              class:  "grocery-icon"
  end
end
