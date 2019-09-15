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

ActiveRecord::Schema.define(version: 2019_09_15_205221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "store_owners", force: :cascade do |t|
    t.string "name"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_owners_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_types", force: :cascade do |t|
    t.integer "type_num"
    t.string "description"
    t.integer "nature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "transaction_type_id"
    t.datetime "occurred_at"
    t.decimal "value", precision: 11, scale: 2
    t.string "cpf"
    t.string "credit_card_number"
    t.bigint "store_id"
    t.bigint "store_owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_transactions_on_store_id"
    t.index ["store_owner_id"], name: "index_transactions_on_store_owner_id"
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
  end

  add_foreign_key "store_owners", "stores"
  add_foreign_key "transactions", "store_owners"
  add_foreign_key "transactions", "stores"
  add_foreign_key "transactions", "transaction_types"
end
