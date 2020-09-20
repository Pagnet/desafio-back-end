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

ActiveRecord::Schema.define(version: 2020_09_19_234258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "attached_files", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "filename", null: false
    t.string "filepath", null: false
    t.string "kind", null: false
    t.string "status", default: "pending", null: false
    t.json "metadata"
    t.datetime "processed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "financial_negotiations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "negotiation_kind"
    t.datetime "occurrence_at"
    t.decimal "movement_value", precision: 18, scale: 2
    t.string "beneficiary_identifier"
    t.string "credit_card"
    t.uuid "shopkeeper_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shopkeeper_id"], name: "index_financial_negotiations_on_shopkeeper_id"
  end

  create_table "shopkeepers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "representative"
    t.decimal "total_balance", precision: 18, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "financial_negotiations", "shopkeepers"
end
