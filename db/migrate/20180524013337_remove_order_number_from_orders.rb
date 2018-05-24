class RemoveOrderNumberFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :order_number, :integer
  end
end
