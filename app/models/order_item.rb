class OrderItem < ApplicationRecord

  belongs_to :cart
  belongs_to :order

  # has_many :employee_carts
  # has_many :carts

  # def add_employee_cart_to_order_item(cart)
  #   current_employee_cart = employee_carts.find_by(employee_cart_id: employee_cart.id)

  #   if current_employee_cart
  #     current_employee_cart = order_item.build(employee_cart_id: employee_cart.id)
  #   else
  #     current_employee_cart = order_item.build(employee_cart_id: employee_cart.id)
  #   end

  #   current_employee_cart
  # end
end
