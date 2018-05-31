class AddTaxToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :tax, :decimal
  end
end
