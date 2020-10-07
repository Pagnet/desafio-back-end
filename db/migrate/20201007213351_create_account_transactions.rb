class CreateAccountTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :account_transactions do |t|
      t.references :transaction_kind, null: false, foreign_key: true
      t.date :exec_date
      t.time :exec_time
      t.monetize :value
      t.string :card
      t.string :cpf
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
