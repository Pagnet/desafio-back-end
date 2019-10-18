class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name, null: false, index: true
      t.string :owner, null: false, index: true

      t.timestamps
    end
  end
end
