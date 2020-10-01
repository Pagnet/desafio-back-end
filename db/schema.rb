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

ActiveRecord::Schema.define(version: 2020_10_01_003431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arquivo_cnabs", force: :cascade do |t|
    t.jsonb "documento", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documentacao_cnabs", force: :cascade do |t|
    t.bigint "tipo_de_transacao_id", null: false
    t.date "data", null: false
    t.decimal "valor", null: false
    t.string "cpf", null: false
    t.string "cartao", null: false
    t.string "hora", null: false
    t.string "dono_da_loja", null: false
    t.string "nome_da_loja", null: false
    t.bigint "arquivo_cnab_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["arquivo_cnab_id"], name: "index_documentacao_cnabs_on_arquivo_cnab_id"
    t.index ["cartao"], name: "index_documentacao_cnabs_on_cartao"
    t.index ["cpf"], name: "index_documentacao_cnabs_on_cpf"
    t.index ["dono_da_loja"], name: "index_documentacao_cnabs_on_dono_da_loja"
    t.index ["nome_da_loja"], name: "index_documentacao_cnabs_on_nome_da_loja"
    t.index ["tipo_de_transacao_id"], name: "index_documentacao_cnabs_on_tipo_de_transacao_id"
  end

  create_table "tipo_de_transacaos", force: :cascade do |t|
    t.integer "tipo", null: false
    t.string "descricao", null: false
    t.string "natureza", null: false
    t.string "sinal", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tipo"], name: "index_tipo_de_transacaos_on_tipo"
  end

  add_foreign_key "documentacao_cnabs", "arquivo_cnabs"
  add_foreign_key "documentacao_cnabs", "tipo_de_transacaos"
end
