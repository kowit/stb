class AddLineItemToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :line_item, foreign_key: true
  end
end
