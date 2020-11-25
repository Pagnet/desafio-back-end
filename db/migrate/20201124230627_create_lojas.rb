class CreateLojas < ActiveRecord::Migration[6.0]
  def change
    create_table :lojas do |t|
      t.string :tp_transacao
      t.string :dt_ocorrencia
      t.decimal :vl_movimentacao, precision: 8, scale: 2 
      t.string :cpf
      t.string :cartao
      t.string :hora
      t.string :nm_representante
      t.string :nm_loja

      t.timestamps
    end
  end
end
