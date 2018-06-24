require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    # line_items: Field::HasMany,
    # employee_line_items: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    # item_type: Field::String,
    item_type: SelectField.with_options(
      choices: ["", "Cold Drink", "Hot Drink", "Pastry",
                "Sandwich", "Salad", "Breakfast"]
    ),
    price: Field::Number.with_options(
      searchable: false,
      prefix: "$",
      decimal: 2
    ),
    description: TrixField,
    image: Field::Carrierwave.with_options(
      image: :standard,
      image_on_index: true,
      remove_url: false
    ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    active: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    # :line_items,
    # :employee_line_items,
    :id,
    :name,
    :price,
    :item_type,
    :active,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    # :line_items,
    # :employee_line_items,
    :id,
    :name,
    :item_type,
    :price,
    :description,
    :image,
    :created_at,
    :updated_at,
    :active,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :line_items,
    # :employee_line_items,
    # :employee_cart,
    :name,
    :item_type,
    :price,
    :description,
    :image,
    :active,
  ].freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item)
  #   "Item ##{item.id}"
  # end
end
