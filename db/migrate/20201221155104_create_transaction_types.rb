class CreateTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types do |t|
      t.integer :sort
      t.string :description
      t.integer :kind
      t.integer :signal

      t.timestamps
    end
  end
end
