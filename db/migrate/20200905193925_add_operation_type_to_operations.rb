class AddOperationTypeToOperations < ActiveRecord::Migration[5.2]
  def change
    add_reference :operations, :operation_type, foreign_key: true
  end
end
