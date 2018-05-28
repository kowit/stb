class CreateEmployeeLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_line_items do |t|
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
