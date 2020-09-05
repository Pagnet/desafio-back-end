class RemoveOperationTypeFromOperations < ActiveRecord::Migration[5.2]
  def change
    remove_column :operations, :operation_type, :integer
  end
end
