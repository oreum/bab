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

ActiveRecord::Schema.define(version: 20150616084542) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveryinfos", force: :cascade do |t|
    t.string   "username"
    t.string   "receiver"
    t.string   "number"
    t.string   "phonenumber"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "order_id"
  end

  add_index "items", ["cart_id"], name: "index_items_on_cart_id"
  add_index "items", ["product_id"], name: "index_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "bank"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "qnas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "phonenumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
