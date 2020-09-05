class AddChavesToTransacaos < ActiveRecord::Migration[6.0]
  def change
  	add_foreign_key :transacaos, :lojas
  	add_foreign_key :transacaos, :tipo_transacaos
  end
end
