class AddAddinToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :addins, :string
  end
end
