class CreateTipoDeTransacaos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_de_transacaos do |t|
      t.integer :tipo, null: false, index: true
      t.string :descricao, null: false
      t.string :natureza, null: false
      t.string :sinal, null: false

      t.timestamps
    end
  end
end
