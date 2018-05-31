class AddTotalToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :total, :decimal
  end
end
