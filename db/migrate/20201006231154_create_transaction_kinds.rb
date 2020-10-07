class CreateTransactionKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_kinds do |t|
      t.integer :kind, index: { unique: true }
      t.string :description
      t.string :nature
      t.string :signal
      t.integer :multiplier, default: 1
      t.timestamps
    end
  end
end
