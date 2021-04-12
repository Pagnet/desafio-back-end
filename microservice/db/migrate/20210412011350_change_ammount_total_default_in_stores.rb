class ChangeAmmountTotalDefaultInStores < ActiveRecord::Migration[6.1]
  def change
    change_column :stores, :amount_total, :decimal, :default => 0
  end
end
