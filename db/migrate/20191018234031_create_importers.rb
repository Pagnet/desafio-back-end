class CreateImporters < ActiveRecord::Migration[5.2]
  def change
    create_table :importers do |t|
      t.string :file_uploader

      t.timestamps
    end
  end
end
