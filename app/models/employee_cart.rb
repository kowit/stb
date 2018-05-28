class EmployeeCart < ApplicationRecord
  has_many :employee_line_items, dependent: :destroy
  has_many :items

  def add_item_to_employee_cart(item)
    current_item = employee_line_items.find_by(item_id: item.id)

    if current_item
      current_item = employee_line_items.build(item_id: item.id)
    else
      current_item = employee_line_items.build(item_id: item.id)
    end

    current_item
  end

  def total_price
    employee_line_items.to_a.sum { |item| item.total_price }
  end
end
