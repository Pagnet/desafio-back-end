class AddOwnerToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :owner_id, :integer
    remove_column :stores, :owner
  end
end
