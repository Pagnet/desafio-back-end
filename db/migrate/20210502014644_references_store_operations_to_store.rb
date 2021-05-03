class ReferencesStoreOperationsToStore < ActiveRecord::Migration[6.1]
  def change
    add_reference :store_operations, :stores, :bigint, foreign_key: true
  end
end
