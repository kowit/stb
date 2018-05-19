class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :item_type
      t.decimal :price
      t.text :description
      t.string :image

      t.timestamps
    end
    add_index :items, :name
  end
end
