# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_27_030038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "store_operations", force: :cascade do |t|
    t.datetime "operated_at"
    t.integer "amount"
    t.string "card"
    t.string "document"
    t.integer "kind"
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_store_operations_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "storekeeper"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "store_operations", "stores"
end
