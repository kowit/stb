class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart


  has_many :placements
  has_many :orders, through: :placements

  def total_price
    item.price * quantity
  end
end
