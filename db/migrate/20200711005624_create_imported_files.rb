class CreateImportedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :imported_files do |t|
      t.text :attachment_data, null: :false
      
      t.timestamps
    end
  end
end
