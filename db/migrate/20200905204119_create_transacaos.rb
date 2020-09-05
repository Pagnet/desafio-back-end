class CreateTransacaos < ActiveRecord::Migration[6.0]
  def change
    create_table :transacaos do |t|
    	t.datetime :data_hora
      t.float :valor
      t.string :cpf_beneficiario, limit: 15
      t.string :cartao, limit: 12
      t.bigint :loja_id
      t.bigint :tipo_transacao_id
      t.timestamps
    end
  end
end
