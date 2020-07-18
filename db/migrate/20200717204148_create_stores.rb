class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, index: { unique: true }
      t.string :storekeeper

      t.timestamps
    end
  end
end
