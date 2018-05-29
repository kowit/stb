class RemoveItemFromEmployeeCarts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :employee_carts, :item, foreign_key: true
  end
end
