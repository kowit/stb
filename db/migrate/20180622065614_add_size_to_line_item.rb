class AddSizeToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :size, :string
  end
end
