class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :transaction_kind, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.date :send_date
      t.time :send_time
      t.monetize :value, currency: { present: true }

      t.timestamps
    end
  end
end
