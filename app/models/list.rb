class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :prices, through: :items
  has_many :stores, through: :prices

  validates :name, presence: :true

  def active_stores
    stores.distinct
  end

  def all_items_selected?
    items.any? && items.all? { |item| item.price_id.present? }
  end

  def total_potential_savings
    items.sum { |item| item.savings_if_cheapest || 0 }
  end

  # Nearest-neighbour sort: reorders active stores so the total walking/driving
  # distance between them is as short as possible.
  #
  # How it works:
  #   1. Start from the first store in the list.
  #   2. Repeatedly pick the closest unvisited store (using straight-line
  #      Haversine distance between GPS coordinates).
  #   3. Return the new ordered array.
  #
  # This does NOT change any store attributes — only the order they appear in.
  # The Mapbox client-side optimizer in map_controller.js does the same thing
  # via the Mapbox API; this method gives us the same result server-side (e.g.
  # to render a sorted store list in the view without waiting for JS).
  def stores_sorted_by_distance
    unsorted = active_stores.to_a
    return unsorted if unsorted.length <= 1

    sorted = [unsorted.shift]          # begin with the first store
    until unsorted.empty?
      last = sorted.last
      # Find the remaining store closest to where we currently are
      nearest = unsorted.min_by do |s|
        haversine_km(last.latitude, last.longitude, s.latitude, s.longitude)
      end
      sorted << nearest
      unsorted.delete(nearest)
    end
    sorted
  end

  private

  # Haversine formula — returns the great-circle distance in kilometres between
  # two points given their latitude/longitude in decimal degrees.
  #
  # The formula works by projecting the central angle between the two points
  # onto a unit sphere (Earth radius ≈ 6 371 km).  It is accurate enough for
  # sorting purposes and needs no external gem.
  def haversine_km(lat1, lon1, lat2, lon2)
    rad   = Math::PI / 180
    dlat  = (lat2 - lat1) * rad
    dlon  = (lon2 - lon1) * rad
    a = Math.sin(dlat / 2)**2 +
        Math.cos(lat1 * rad) * Math.cos(lat2 * rad) * Math.sin(dlon / 2)**2
    6371 * 2 * Math.asin(Math.sqrt(a))
  end
end
