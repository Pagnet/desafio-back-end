class ChangeSignalColumnTypeInTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :transaction_types, :signal, "integer USING CAST(signal AS integer)"
  end
end
