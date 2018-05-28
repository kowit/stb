class AddItemToEmployeeCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_carts, :item, foreign_key: true
  end
end
