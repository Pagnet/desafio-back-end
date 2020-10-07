class CreateCnabImports < ActiveRecord::Migration[6.0]
  def change
    create_table :cnab_imports do |t|
      t.string :name
      t.string :file
      t.string :status
      t.timestamps
    end
  end
end
