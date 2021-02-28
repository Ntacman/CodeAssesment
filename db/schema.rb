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

ActiveRecord::Schema.define(version: 2021_02_26_015627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "quantity"
    t.string "color"
    t.string "size"
    t.decimal "weight"
    t.integer "price_cents"
    t.integer "sale_price_cents"
    t.integer "cost_cents"
    t.string "sku", null: false
    t.decimal "length"
    t.decimal "width"
    t.decimal "height"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "inventory_id", null: false
    t.string "street_address", null: false
    t.string "apartment", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "country_code", null: false
    t.string "zip", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.string "order_status", null: false
    t.string "payment_ref", null: false
    t.string "transaction_id", null: false
    t.integer "payment_amt_cents", null: false
    t.integer "ship_charged_cents", null: false
    t.integer "ship_cost_cents", null: false
    t.integer "subtotal_cents", null: false
    t.integer "total_cents", null: false
    t.string "shipper_name", null: false
    t.datetime "payment_date", null: false
    t.datetime "shipped_date", null: false
    t.string "tracking_number", null: false
    t.integer "tax_total_cents", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name", null: false
    t.string "description"
    t.string "style", null: false
    t.string "brand", null: false
    t.string "url"
    t.string "product_type"
    t.integer "shipping_price", null: false
    t.string "note"
    t.integer "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.boolean "superadmin", null: false
    t.string "shop_name", null: false
    t.string "remember_token"
    t.string "card_brand", null: false
    t.string "card_last_four", null: false
    t.string "trial_ends_at", null: false
    t.string "shop_domain", null: false
    t.boolean "is_enabled", null: false
    t.string "billing_plan", null: false
    t.datetime "trial_starts_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
