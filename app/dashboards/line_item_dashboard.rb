require "administrate/base_dashboard"

class LineItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    item: Field::BelongsTo,
    cart: Field::BelongsTo,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    quantity: Field::Number,
    name: Field::String,
    item_type: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :item,
    :cart,
    :id,
    :created_at,
    :name,
    :item_type
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :item,
    :cart,
    :id,
    :created_at,
    :updated_at,
    :quantity,
    :name,
    :item_type
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :item,
    :cart,
    :quantity,
    :name,
    :item_type
  ].freeze

  # Overwrite this method to customize how line items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(line_item)
  #   "LineItem ##{line_item.id}"
  # end
end
