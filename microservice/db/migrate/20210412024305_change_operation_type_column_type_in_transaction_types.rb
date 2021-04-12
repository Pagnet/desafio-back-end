class ChangeOperationTypeColumnTypeInTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :transaction_types, :operation_type, "integer USING CAST(operation_type AS integer)"
  end
end
