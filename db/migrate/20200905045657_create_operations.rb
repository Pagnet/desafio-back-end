class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.integer :operation_type
      t.datetime :occurred_at
      t.decimal :value, precision: 12, scale: 2
      t.string :cpf
      t.string :card_number
      t.string :owner
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
