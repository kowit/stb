class AddOrderItemToEmployeeCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_carts, :order_item, foreign_key: true
  end
end
