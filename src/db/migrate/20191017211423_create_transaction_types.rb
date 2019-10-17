class CreateTransactionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_types do |t|
      t.string :description, null: false, unique: true
      t.references :transaction_kind, foreign_key: true

      t.timestamps
    end
  end
end
