class UpdateColumnNameOccurenceDateInTransactions < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :occurence_date, :occurrence_date
  end
end
