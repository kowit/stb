class AddOrderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :orders, foreign_key: true
  end
end
