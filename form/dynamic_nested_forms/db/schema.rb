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

ActiveRecord::Schema.define(version: 20141031060607) do

  create_table "corporations", force: true, comment: "法人" do |t|
    t.string   "name",       null: false, comment: "名称"
    t.string   "name_kana",  null: false, comment: "名称カナ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: true, comment: "注文明細" do |t|
    t.integer  "order_id",                            null: false, comment: "注文ID"
    t.integer  "product_id",                          null: false, comment: "商品ID"
    t.decimal  "unit_price", precision: 10, scale: 0, null: false, comment: "単価"
    t.integer  "quantity",                            null: false, comment: "数量"
    t.decimal  "price",      precision: 10, scale: 0, null: false, comment: "小計"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "order_details", ["order_id"], name: "order_details_order_id_fk", using: :btree
  add_index "order_details", ["product_id"], name: "order_details_product_id_fk", using: :btree

  create_table "orders", force: true, comment: "注文" do |t|
    t.string   "name",                                    null: false, comment: "注文名称"
    t.integer  "corporation_id",                          null: false, comment: "取引先"
    t.decimal  "price",          precision: 10, scale: 0, null: false, comment: "合計金額"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "orders", ["corporation_id"], name: "orders_corporation_id_fk", using: :btree

  create_table "products", force: true, comment: "商品" do |t|
    t.string   "code",                       null: false, comment: "商品コード"
    t.string   "name",                       null: false, comment: "商品名"
    t.string   "name_kana",     default: "", null: false, comment: "商品名カナ"
    t.integer  "price",                      null: false, comment: "商品価格"
    t.integer  "purchase_cost",              null: false, comment: "仕入原価"
    t.boolean  "availability",               null: false, comment: "販売可能フラグ"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_foreign_key "order_details", "orders", name: "order_details_order_id_fk"
  add_foreign_key "order_details", "products", name: "order_details_product_id_fk"

  add_foreign_key "orders", "corporations", name: "orders_corporation_id_fk"

end
