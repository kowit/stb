require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    # name: Field::String,
    order_status: Field::Boolean,
    subtotal: Field::String.with_options(searchable: false),
    tax: Field::String.with_options(searchable: false),
    total: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    order_items: Field::HasMany,
    # user: Field::BelongsTo,
    # carts: Field::HasMany,
    # cart_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    # :name,
    :subtotal,
    :tax,
    :total,
    :order_status,
    :order_items,
    # :user,
    # :carts,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    # :name,
    :subtotal,
    :tax,
    :total,
    :order_status,
    :order_items,
    :created_at,
    :updated_at,
    # :user,
    # :carts,
    # :cart_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :name,
    :subtotal,
    :tax,
    :total,
    :order_status,
    :order_items,
    # :user,
    # :carts,
    # :cart_id,
  ].freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order)
  #   "Order ##{order.id}"
  # end
end
