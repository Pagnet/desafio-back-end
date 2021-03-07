class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :kind
      t.datetime :paid_at
      t.integer :amount_in_cents
      t.string :document_number
      t.string :card_number

      t.timestamps
    end
  end
end
