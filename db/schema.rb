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

ActiveRecord::Schema.define(version: 2020_11_24_233704) do

  create_table "importacaos", force: :cascade do |t|
    t.string "arquivo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lojas", force: :cascade do |t|
    t.string "tp_transacao"
    t.string "dt_ocorrencia"
    t.decimal "vl_movimentacao", precision: 8, scale: 2
    t.string "cpf"
    t.string "cartao"
    t.string "hora"
    t.string "nm_representante"
    t.string "nm_loja"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
