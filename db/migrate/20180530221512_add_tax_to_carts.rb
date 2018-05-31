class AddTaxToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :tax, :decimal
  end
end
