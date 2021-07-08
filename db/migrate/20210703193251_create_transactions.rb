class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type
      t.string :date
      t.float :value
      t.string :cpf
      t.string :card
      t.string :hour
      t.string :store_owner
      t.string :store_name
      t.timestamps
    end
  end
end
