class CreateCnabFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :cnab_files do |t|
      t.string :filename
      t.text :body

      t.timestamps
    end

    change_table :transactions do |t|
      t.references :cnab_file, foreign_key: true
    end
  end
end
