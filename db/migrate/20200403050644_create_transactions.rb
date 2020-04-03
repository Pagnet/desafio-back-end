class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :transaction_type, foreign_key: true
      t.references :credit_card, foreign_key: true
      t.references :store, foreign_key: true
      t.date :event_date
      t.time :event_time
      t.decimal :amount
      t.string :beneficiary_cpf

      t.timestamps
    end
  end
end
