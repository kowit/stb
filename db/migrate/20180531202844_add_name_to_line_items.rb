class AddNameToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :name, :string
    add_column :line_items, :item_type, :string
  end
end
