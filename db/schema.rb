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

ActiveRecord::Schema.define(version: 2020_09_05_204234) do

  create_table "lojas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nome", limit: 19
    t.string "nome_representante", limit: 14
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipo_transacaos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "descricao", limit: 50
    t.integer "natureza"
    t.integer "sinal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transacaos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "data_hora"
    t.float "valor"
    t.string "cpf_beneficiario", limit: 15
    t.string "cartao", limit: 12
    t.bigint "loja_id"
    t.bigint "tipo_transacao_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loja_id"], name: "fk_rails_048a0eddea"
    t.index ["tipo_transacao_id"], name: "fk_rails_31464e7104"
  end

  create_table "usuarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nome", limit: 25
    t.string "cpf", limit: 15
    t.string "email", limit: 50
    t.string "celular", limit: 15
    t.string "user", limit: 25
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "transacaos", "lojas"
  add_foreign_key "transacaos", "tipo_transacaos"
end
