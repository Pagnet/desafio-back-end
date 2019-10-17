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

ActiveRecord::Schema.define(version: 2019_10_17_211423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "transaction_kinds", force: :cascade do |t|
    t.string "description", null: false
    t.string "signal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "description", null: false
    t.bigint "transaction_kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_kind_id"], name: "index_transaction_types_on_transaction_kind_id"
  end

  add_foreign_key "transaction_types", "transaction_kinds"
end
