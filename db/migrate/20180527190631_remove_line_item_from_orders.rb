class RemoveLineItemFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_reference :orders, :line_item, foreign_key: true
  end
end
