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

ActiveRecord::Schema.define(version: 2020_07_11_191827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "imported_files", force: :cascade do |t|
    t.text "attachment_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "imported_file_id", null: false
    t.datetime "occurrence_datetime", null: false
    t.integer "value", null: false
    t.string "beneficiary_document", null: false
    t.string "credit_card_number", null: false
    t.hstore "type_info", default: {"kind"=>nil, "description"=>nil}
    t.hstore "store_info", default: {"name"=>nil, "owner_name"=>nil}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imported_file_id"], name: "index_transactions_on_imported_file_id"
  end

end
