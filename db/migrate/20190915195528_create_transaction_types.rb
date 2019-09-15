class CreateTransactionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_types do |t|
      t.integer :type_num
      t.string :description
      t.integer :nature

      t.timestamps
    end
  end
end
