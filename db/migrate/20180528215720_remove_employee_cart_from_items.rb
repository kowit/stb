class RemoveEmployeeCartFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_reference :items, :employee_cart, foreign_key: true
  end
end
