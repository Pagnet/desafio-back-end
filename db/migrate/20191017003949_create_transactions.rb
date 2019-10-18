class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :customer, index: true, foreign_key: true, on_delete: :cascade
      t.integer :transaction_type, limit: 1, null: false
      t.decimal :value, precision: 8, scale: 2, null: false
      t.string :card_number, limit: 12
      t.datetime :ocurrence_datetime, null: false
      t.timestamps
    end
  end
end
