class CreateCnabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cnabs do |t|
      t.string :tipo
      t.string :data
      t.decimal :valor, :precision => 10, :scale => 2
      t.string :cpf
      t.string :cartao
      t.string :hora
      t.string :dono_da_loja
      t.string :nome_da_loja

      t.timestamps
    end
  end
end
