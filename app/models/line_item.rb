class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :user

  def total_price
    item.price * quantity
  end

  def set_default_attributes
    default_no_choice = "None"
    default_espresso_shots = 0
    default_size = "Small"
    self.update(size: default_size,
                flavor: default_no_choice,
                addins: default_no_choice,
                espresso_shots: default_espresso_shots)
  end

end
