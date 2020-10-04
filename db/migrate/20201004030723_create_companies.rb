class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :owner, null: false, limit: 14
      t.string :name, null: false, limit: 19
      t.decimal :total, default: 0, precision: 8, scale: 2

      t.timestamps
    end
  end
end
