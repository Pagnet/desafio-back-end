class DeletingWrongConnectionToStoresTable < ActiveRecord::Migration[6.1]
  def change
    remove_reference :stores, :store_operations, index: true
  end
end
