class EmployeeLineItem < ApplicationRecord
  belongs_to :item
  belongs_to :employee_cart
end
