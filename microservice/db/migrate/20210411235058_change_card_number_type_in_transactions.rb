class ChangeCardNumberTypeInTransactions < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :card_number, :string, :limit => 11
  end
end
