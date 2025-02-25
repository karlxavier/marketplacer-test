# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_25_045518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.integer "quantity", default: 1
    t.decimal "product_price", precision: 15, scale: 2
    t.decimal "line_total", precision: 15, scale: 2
    t.string "product_uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "subtotal", precision: 15, scale: 2
    t.decimal "discount_amount", precision: 15, scale: 2
    t.decimal "total_price", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "discount_rules", force: :cascade do |t|
    t.jsonb "rules", default: [{}]
    t.jsonb "calculations", default: [{}]
    t.string "message"
    t.string "group_name"
    t.boolean "status", default: true
    t.integer "priority", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discount_transactions", force: :cascade do |t|
    t.bigint "discount_rule_id", null: false
    t.string "discountable_type", null: false
    t.bigint "discountable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_rule_id"], name: "index_discount_transactions_on_discount_rule_id"
    t.index ["discountable_type", "discountable_id"], name: "index_discount_transactions_on_discountable"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "carts", "users"
  add_foreign_key "discount_transactions", "discount_rules"
end
