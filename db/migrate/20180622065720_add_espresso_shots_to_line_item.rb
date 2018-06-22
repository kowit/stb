class AddEspressoShotsToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :espresso_shots, :integer
  end
end
