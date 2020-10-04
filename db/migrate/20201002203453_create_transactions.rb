class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type, null: false
      t.datetime :date, null: false
      t.decimal :value, null: false, precision: 8, scale: 2
      t.string :cpf, null: false, limit: 14
      t.string :credit_card, null: false, limit: 12

      t.timestamps
    end
  end
end
