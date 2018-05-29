class AddOrderItemToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :order_item, foreign_key: true
  end
end
