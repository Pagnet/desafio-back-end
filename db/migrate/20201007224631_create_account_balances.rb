class CreateAccountBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :account_balances do |t|
      t.references :company, null: false, foreign_key: true
      t.monetize :value

      t.timestamps
    end
  end
end
