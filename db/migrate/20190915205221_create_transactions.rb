class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :transaction_type, foreign_key: true
      t.datetime :occurred_at
      t.decimal :value, precision: 11, scale: 2
      t.string :cpf
      t.string :credit_card_number
      t.references :store, foreign_key: true
      t.references :store_owner, foreign_key: true

      t.timestamps
    end
  end
end
