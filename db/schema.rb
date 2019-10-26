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

ActiveRecord::Schema.define(version: 2019_10_26_175352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commerces", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.integer "number"
    t.integer "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_commerces_on_email", unique: true
    t.index ["reset_password_token"], name: "index_commerces_on_reset_password_token", unique: true
  end

  create_table "offices", force: :cascade do |t|
    t.bigint "commerce_id"
    t.string "name"
    t.string "adress"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commerce_id"], name: "index_offices_on_commerce_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity"
    t.bigint "sale_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["sale_id"], name: "index_orders_on_sale_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "quantity"
    t.string "price"
    t.bigint "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_products_on_office_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "total"
    t.boolean "payed", default: false
    t.text "comment"
    t.bigint "table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "office_id"
    t.bigint "commerce_id"
    t.bigint "worker_id"
    t.index ["commerce_id"], name: "index_sales_on_commerce_id"
    t.index ["office_id"], name: "index_sales_on_office_id"
    t.index ["table_id"], name: "index_sales_on_table_id"
    t.index ["worker_id"], name: "index_sales_on_worker_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "size"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "office_id"
    t.index ["office_id"], name: "index_tables_on_office_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.integer "rol"
    t.string "adress"
    t.integer "number"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "commerce_id"
    t.bigint "office_id"
    t.index ["commerce_id"], name: "index_workers_on_commerce_id"
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["office_id"], name: "index_workers_on_office_id"
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true
  end

  add_foreign_key "offices", "commerces"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "sales"
  add_foreign_key "products", "offices"
  add_foreign_key "sales", "tables"
  add_foreign_key "tables", "offices"
  add_foreign_key "workers", "commerces"
end
