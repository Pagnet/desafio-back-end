class AddStoreRefToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :store, null: false, foreign_key: true
  end
end
