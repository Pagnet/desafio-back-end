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

ActiveRecord::Schema.define(version: 2020_10_02_203453) do

  create_table "transactions", force: :cascade do |t|
    t.integer "type", null: false
    t.string "date", limit: 10, null: false
    t.decimal "value", precision: 8, scale: 2, null: false
    t.string "cpf", limit: 14, null: false
    t.string "credit_card", limit: 12, null: false
    t.string "time", limit: 8, null: false
    t.string "company", limit: 14, null: false
    t.string "owner", limit: 19, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
