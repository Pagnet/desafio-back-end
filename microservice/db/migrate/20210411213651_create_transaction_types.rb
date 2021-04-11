class CreateTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types do |t|
      t.integer :numeric_type
      t.text :description
      t.string :operation_type
      t.string :signal

      t.timestamps
    end
  end
end
