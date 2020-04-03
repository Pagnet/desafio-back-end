class CreateTransactionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_types do |t|
      t.integer :key
      t.string :description
      t.integer :movement_type
      t.string :icon_representation

      t.timestamps
    end
  end
end
