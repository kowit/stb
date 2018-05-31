class AddOrderItemToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :order_item, foreign_key: true
  end
end
