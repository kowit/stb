class AddTotalWithTaxToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :total_with_tax, :decimal
  end
end
