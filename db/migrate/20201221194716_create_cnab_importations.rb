class CreateCnabImportations < ActiveRecord::Migration[6.1]
  def change
    create_table :cnab_importations do |t|
      t.integer :status
      t.jsonb :file

      t.timestamps
    end
  end
end
