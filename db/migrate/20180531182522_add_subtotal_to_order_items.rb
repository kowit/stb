class AddSubtotalToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :subtotal, :decimal
  end
end
