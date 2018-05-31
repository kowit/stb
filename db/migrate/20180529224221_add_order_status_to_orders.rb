class AddOrderStatusToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :status, :boolean, null: false, default: false
  end
end
