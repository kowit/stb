class RemoveCartFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_reference :orders, :cart, foreign_key: true
  end
end
