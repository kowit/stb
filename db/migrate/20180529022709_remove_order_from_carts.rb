class RemoveOrderFromCarts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :carts, :order, foreign_key: true
  end
end
