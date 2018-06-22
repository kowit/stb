class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :user

  def total_price
    item.price * quantity
  end

end
