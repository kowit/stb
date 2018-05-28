class CreateEmployeeCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_carts do |t|
      t.references :employee_line_item, foreign_key: true

      t.timestamps
    end
  end
end
