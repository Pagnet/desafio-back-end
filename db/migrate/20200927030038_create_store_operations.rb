class CreateStoreOperations < ActiveRecord::Migration[6.0]
  def change
    create_table :store_operations do |t|
      t.datetime :operated_at
      t.integer :amount
      t.string :card
      t.string :document
      t.integer :kind
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
