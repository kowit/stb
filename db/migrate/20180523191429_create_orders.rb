class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :total
      t.integer :order_number
      t.string :status

      t.timestamps
    end
    add_index :orders, :order_number
    add_index :orders, :status
  end
end
