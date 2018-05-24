class Order < ApplicationRecord
  # before_validation :set_total!
  # validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :carts
  has_many :line_items, through: :carts

  def tax_amount
    tax = 7.0 / 100.0
    tax
  end

  def subtotal_of_order
    self.subtotal
    # self.subtotal = line_items.to_a.sum { |item| item.total_price }
    # self.subtotal = line_item.total_price
  end

  def total_price_of_order
    self.total = subtotal_of_order * tax_amount
    # self.total_price = subtotal_of_order * TAX
  end

  # def set_total!
  #     self.total = products.map(&:price).sum
  # end
end
