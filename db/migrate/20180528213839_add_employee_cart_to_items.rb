class AddEmployeeCartToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :employee_cart, foreign_key: true
  end
end
