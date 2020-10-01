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

ActiveRecord::Schema.define(version: 2020_10_01_105342) do

  create_table "credit_cards", force: :cascade do |t|
    t.string "first_digits"
    t.string "last_digits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "owner_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_types", force: :cascade do |t|
    t.integer "key"
    t.string "description"
    t.integer "movement_type"
    t.string "icon_representation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "transaction_type_id"
    t.integer "credit_card_id"
    t.integer "store_id"
    t.datetime "event_date_time"
    t.decimal "amount"
    t.string "beneficiary_cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_card_id"], name: "index_transactions_on_credit_card_id"
    t.index ["store_id"], name: "index_transactions_on_store_id"
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
  end

end
