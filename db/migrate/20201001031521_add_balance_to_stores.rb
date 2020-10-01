class AddBalanceToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :balance, :decimal, default: 0
  end
end
