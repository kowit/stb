class OrderItem < ApplicationRecord
  # has_many :carts, dependent: :nullify
  belongs_to :cart
  belongs_to :order

  # has_many :employee_carts
  # has_many :carts

  # def add_cart(cart)
  #   current_cart = order_items.find_by(cart_id: cart.id)
  #   if current_cart
  #     current_cart = order_items.build(cart_id: cart.id)
  #   else
  #     current_cart = order_items.build(cart_id: cart.id)
  #   end
  #   current_cart
  # end
end
