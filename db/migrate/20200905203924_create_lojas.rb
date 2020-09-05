class CreateLojas < ActiveRecord::Migration[6.0]
  def change
    create_table :lojas do |t|
    	t.string :nome, limit: 19
    	t.string :nome_representante, limit: 14
    	t.timestamps
    end
  end
end