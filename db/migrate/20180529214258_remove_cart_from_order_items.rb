class RemoveCartFromOrderItems < ActiveRecord::Migration[5.1]
  def change
    remove_reference :order_items, :cart, foreign_key: true
  end
end
