class ScanPrice < ApplicationRecord
  belongs_to :price
  belongs_to :scan
end
