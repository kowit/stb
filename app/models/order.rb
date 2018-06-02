class Order < ApplicationRecord
  # before_validation :set_total!
  # validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # belongs_to :user

  has_many :order_items, dependent: :destroy
  # belongs_to :order_items, optional: true
  belongs_to :user, optional: true

  def add_cart(cart)
    # Build the order item
    current_order = order_items.find_by(cart_id: cart.id,
                                       subtotal: cart.total,
                                       tax: cart.tax,
                                       total: cart.total_with_tax)
    if current_order
      current_order = order_items.build(cart_id: cart.id,
                                       subtotal: cart.total,
                                       tax: cart.tax,
                                       total: cart.total_with_tax)
    else
      current_order = order_items.build(cart_id: cart.id,
                                       subtotal: cart.total,
                                       tax: cart.tax,
                                       total: cart.total_with_tax)
    end

    current_order
  end

  def update_cart_order_attribute
    self.order_items.map { |oi| oi.cart.update(order_id: self.id) }
  end

  # update the Order's attributes
  def update_attribs(current_user_id, cart_subtotal, cart_total, cart_tax, order_status)

    self.update(tax: cart_tax, user_id: current_user_id,
                subtotal: cart_subtotal, total: cart_total,
                status: order_status)
  end


  # def tax_amount
  #   tax = 7.0 / 100.0
  #   tax
  # end

  # def set_subtotal
  #   self.subtotal = line_items.map(&:price).sum
  # end

  # def total_price_of_order
  #   self.total = subtotal_of_order * tax_amount
  # end

  # def set_total!
  #     self.total = products.map(&:price).sum
  # end
end
