# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150621142302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.integer  "order_id"
    t.integer  "country_id"
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["order_id"], name: "index_addresses_on_order_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.integer  "count_in_stock"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "author_id"
    t.integer  "category_id"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "number"
    t.string   "cvv"
    t.integer  "expiration_month"
    t.integer  "expiration_year"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "customer_id"
  end

  add_index "credit_cards", ["customer_id"], name: "index_credit_cards_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
    t.integer  "book_id"
  end

  add_index "order_items", ["book_id"], name: "index_order_items_on_book_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.float    "total_price"
    t.date     "completed_date"
    t.string   "aasm_state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "customer_id"
    t.integer  "credit_card_id"
  end

  add_index "orders", ["credit_card_id"], name: "index_orders_on_credit_card_id", using: :btree
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.text     "note"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "book_id"
    t.integer  "customer_id"
  end

  add_index "ratings", ["book_id"], name: "index_ratings_on_book_id", using: :btree
  add_index "ratings", ["customer_id"], name: "index_ratings_on_customer_id", using: :btree

  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "orders"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "categories"
  add_foreign_key "credit_cards", "customers"
  add_foreign_key "order_items", "books"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "credit_cards"
  add_foreign_key "orders", "customers"
  add_foreign_key "ratings", "books"
  add_foreign_key "ratings", "customers"
end
