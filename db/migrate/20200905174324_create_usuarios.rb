class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :nome, limit: 25
      t.string :cpf, limit: 15
      t.string :email, limit: 50
      t.string :celular, limit: 15
      t.string :user, limit: 25
      t.string :password_digest
      t.timestamps
    end
  end
end
