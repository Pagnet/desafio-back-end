class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :owner

      t.timestamps
    end

    add_index :stores, [:name, :owner], :unique => true
  end
end
