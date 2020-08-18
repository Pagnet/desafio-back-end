class CreateFinancialEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_entries do |t|
      t.integer :kind, null: false, index: true
      t.date :transaction_date, null: false
      t.time :transaction_time, null: false
      t.decimal :amount, null: false
      t.string :social_number, null: false
      t.string :card_number, null: false
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
