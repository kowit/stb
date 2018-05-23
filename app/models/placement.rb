class Placement < ApplicationRecord
  belongs_to :order
  belongs_to :line_items
end
