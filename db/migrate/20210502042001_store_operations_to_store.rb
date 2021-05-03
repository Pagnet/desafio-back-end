class StoreOperationsToStore < ActiveRecord::Migration[6.1]
  def change
    add_reference :store_operations, :store, index: true
    add_foreign_key :store_operations, :stores
  end
end
