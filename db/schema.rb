# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180530221512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "line_item_id"
    t.bigint "order_item_id"
    t.bigint "order_id"
    t.bigint "user_id"
    t.decimal "total"
    t.decimal "total_with_tax"
    t.decimal "tax"
    t.index ["line_item_id"], name: "index_carts_on_line_item_id"
    t.index ["order_id"], name: "index_carts_on_order_id"
    t.index ["order_item_id"], name: "index_carts_on_order_item_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "employee_carts", force: :cascade do |t|
    t.bigint "employee_line_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_item_id"
    t.index ["employee_line_item_id"], name: "index_employee_carts_on_employee_line_item_id"
    t.index ["order_item_id"], name: "index_employee_carts_on_order_item_id"
  end

  create_table "employee_line_items", force: :cascade do |t|
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_cart_id"
    t.index ["employee_cart_id"], name: "index_employee_line_items_on_employee_cart_id"
    t.index ["item_id"], name: "index_employee_line_items_on_item_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "item_type"
    t.decimal "price"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.bigint "employee_cart_id"
    t.index ["employee_cart_id"], name: "index_items_on_employee_cart_id"
    t.index ["name"], name: "index_items_on_name"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "user_id"
    t.decimal "price"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["item_id"], name: "index_line_items_on_item_id"
    t.index ["user_id"], name: "index_line_items_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_order_items_on_cart_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "subtotal"
    t.decimal "tax"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_item_id"
    t.boolean "status", default: false, null: false
    t.string "name"
    t.index ["order_item_id"], name: "index_orders_on_order_item_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "stripe_id"
    t.bigint "orders_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["orders_id"], name: "index_users_on_orders_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "line_items"
  add_foreign_key "carts", "order_items"
  add_foreign_key "carts", "orders"
  add_foreign_key "carts", "users"
  add_foreign_key "employee_carts", "employee_line_items"
  add_foreign_key "employee_carts", "order_items"
  add_foreign_key "employee_line_items", "employee_carts"
  add_foreign_key "employee_line_items", "items"
  add_foreign_key "items", "employee_carts"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "items"
  add_foreign_key "line_items", "users"
  add_foreign_key "order_items", "carts"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_items"
  add_foreign_key "orders", "users"
  add_foreign_key "users", "orders", column: "orders_id"
end
