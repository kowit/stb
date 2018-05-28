class AddEmployeeCartToEmployeeLineItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_line_items, :employee_cart, foreign_key: true
  end
end
