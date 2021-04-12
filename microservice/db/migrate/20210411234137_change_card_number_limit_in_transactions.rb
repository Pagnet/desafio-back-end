class ChangeCardNumberLimitInTransactions < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :card_number, :numeric, :limit => 11
  end
end
