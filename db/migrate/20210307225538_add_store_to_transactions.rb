class AddStoreToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :store_id, :integer
  end
end
