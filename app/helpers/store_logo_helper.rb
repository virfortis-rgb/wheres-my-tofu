module StoreLogoHelper
  # Keys are the exact store names from the database.
  # To add a new store: add its exact name here and drop the PNG in store-logos/.
  STORE_LOGO_MAP = {
    "スーパー玉出 周防町店"           => "tamade",
    "ライフ 西長堀店"                 => "life",
    "イオン 大阪ドームシティ店"        => "aeon",
    "イトーヨーカドー 大阪ドーム前店"  => "ito-yokado",
    "ドン・キホーテ 四ツ橋店"          => "don-quijote",
  }.freeze

  def store_logo_tag(store_name, size: 28)
    slug = STORE_LOGO_MAP[store_name.to_s.strip]

    if slug
      image_tag "store-logos/#{slug}.png",
                alt:    store_name,
                width:  size,
                height: size,
                class:  "store-logo"
    else
      content_tag :span, store_name.to_s.first,
                  class: "store-logo-initial",
                  style: "width:#{size}px;height:#{size}px;font-size:#{(size * 0.45).round}px",
                  aria:  { label: store_name }
    end
  end
end
