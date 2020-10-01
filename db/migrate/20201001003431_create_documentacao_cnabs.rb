class CreateDocumentacaoCnabs < ActiveRecord::Migration[6.0]
  def change
    create_table :documentacao_cnabs do |t|
      t.references :tipo_de_transacao, null: false, index: true, foreign_key: true
      t.date :data, null: false
      t.decimal :valor, null: false
      t.string :cpf, null: false, index: true
      t.string :cartao, null: false, index: true
      t.string :hora, null: false
      t.string :dono_da_loja, null: false, index: true
      t.string :nome_da_loja, null: false, index: true
      t.references :arquivo_cnab, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
