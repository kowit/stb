require "administrate/base_dashboard"

class EmployeeCartDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    employee_line_items: Field::HasMany,
    items: Field::HasMany,
    id: Field::Number,
    employee_line_item_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    item_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :employee_line_items,
    :items,
    :id,
    :employee_line_item_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :employee_line_items,
    :items,
    :id,
    :employee_line_item_id,
    :created_at,
    :updated_at,
    :item_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :employee_line_items,
    :items,
    :employee_line_item_id,
    :item_id,
  ].freeze

  # Overwrite this method to customize how employee carts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(employee_cart)
  #   "EmployeeCart ##{employee_cart.id}"
  # end
end
