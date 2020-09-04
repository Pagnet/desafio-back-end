class CreateImporters < ActiveRecord::Migration[5.2]
  def change
    create_table :importers do |t|
      t.integer :status

      t.timestamps
    end
  end
end
