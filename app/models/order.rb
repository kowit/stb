class Order < ApplicationRecord
  belongs_to :user

  before_validation :set_total!

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :placements
  has_many :line_items, through: :placements

  def total_price_of_order
    subtotal_price = line_items.to_a.sum { |item| item.total_price }
    tax = 0.07
    new_total_price = subtotal_price * tax
  end

  # def set_total!
  #     self.total = products.map(&:price).sum
  # end
end
