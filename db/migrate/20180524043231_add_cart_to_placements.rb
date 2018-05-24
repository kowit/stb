class AddCartToPlacements < ActiveRecord::Migration[5.1]
  def change
    add_reference :placements, :cart, foreign_key: true
  end
end
