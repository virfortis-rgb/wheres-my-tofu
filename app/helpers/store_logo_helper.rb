module StoreLogoHelper
  # Maps Japanese store name keywords → logo filename (without extension).
  # Uses include? matching so partial names like "イオン 大阪ドームシティ店" still match "イオン".
  STORE_LOGO_MAP = {
    "スーパー玉出" => "tamade",
    "玉出"         => "tamade",
    "ライフ"       => "life",
    "イオン"       => "aeon",
    "イトーヨーカドー" => "ito-yokado",
    "ドン・キホーテ"   => "don-quijote",
    "ドンキ"           => "don-quijote",
  }.freeze

  def store_logo_tag(store_name, size: 28)
    normalized = store_name.to_s.strip
    match = STORE_LOGO_MAP.find { |keyword, _| normalized.include?(keyword) }
    slug = match&.last

    if slug
      image_tag "store-logos/#{slug}.png",
                alt:    store_name,
                width:  size,
                height: size,
                class:  "store-logo"
    else
      content_tag :span, normalized.first.upcase,
                  class: "store-logo-initial",
                  style: "width:#{size}px;height:#{size}px;font-size:#{(size * 0.45).round}px",
                  aria:  { label: store_name }
    end
  end
end
