class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :transaction_type, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.datetime :processed_at, null: false
      t.float :amount, null: false

      t.timestamps
    end
  end
end
