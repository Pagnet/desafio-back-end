class CreateArquivoCnabs < ActiveRecord::Migration[6.0]
  def change
    create_table :arquivo_cnabs do |t|
      t.jsonb :documento, null: false

      t.timestamps
    end
  end
end
