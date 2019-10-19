class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :transaction_type, foreign_key: true
      t.datetime :date, null: false
      t.decimal :total_amount, precision: 8, scale: 2, null: false
      t.string :cpf
      t.string :card_number
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
