class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :transaction_type, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.datetime :date
      t.decimal :amount, precision: 12, scale: 2
      t.string :cpf
      t.string :card_number

      t.timestamps
    end
  end
end
