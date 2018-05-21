class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :order_items
  default_scope { where(active: true) }
end
