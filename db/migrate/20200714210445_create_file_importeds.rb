class CreateFileImporteds < ActiveRecord::Migration[6.0]
  def change
    create_table :file_importeds do |t|

      t.timestamps
    end
  end
end
