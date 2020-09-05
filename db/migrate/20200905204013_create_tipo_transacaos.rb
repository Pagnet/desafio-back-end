class CreateTipoTransacaos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_transacaos do |t|
    	t.string :descricao, limit: 50
    	t.integer :natureza
    	t.integer :sinal
      t.timestamps
    end
  end
end
