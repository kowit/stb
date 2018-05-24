class Order < ApplicationRecord
  # before_validation :set_total!
  # validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :carts
  # has_many :line_items, through: :carts

  def add_item(line_item_from_cart)
    current_item = cart.line_items.find_by(line_item_id: line_item.id)

    if current_item
      current_item = cart.line_items.find_by(line_item_id: line_item.id)
    else
      current_item = cart.line_items.find_by(line_item_id: line_item.id)
    end

    current_item
  end

  def tax_amount
    tax = 7.0 / 100.0
    tax
  end

  def set_subtotal
    self.subtotal = line_items.map(&:price).sum
  end

  def total_price_of_order
    self.total = subtotal_of_order * tax_amount
  end

  # def set_total!
  #     self.total = products.map(&:price).sum
  # end
end
