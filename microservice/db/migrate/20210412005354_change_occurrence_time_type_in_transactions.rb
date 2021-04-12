class ChangeOccurrenceTimeTypeInTransactions < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :occurrence_time, :string, :limit => 6
  end
end
