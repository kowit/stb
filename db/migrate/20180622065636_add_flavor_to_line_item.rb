class AddFlavorToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :flavor, :string
  end
end
