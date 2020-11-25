class CreateImportacaos < ActiveRecord::Migration[6.0]
  def change
    create_table :importacaos do |t|
      t.string :arquivo

      t.timestamps
    end
  end
end
