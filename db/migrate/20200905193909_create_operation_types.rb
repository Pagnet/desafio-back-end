class CreateOperationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :operation_types do |t|
      t.integer :code
      t.integer :nature

      t.timestamps
    end
    add_index :operation_types, :code
  end
end
