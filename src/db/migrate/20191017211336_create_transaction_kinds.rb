class CreateTransactionKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_kinds do |t|
      t.string :description, null: false, unique: true
      t.string :signal, null: false

      t.timestamps
    end
  end
end
