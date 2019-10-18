class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :cpf, limit: 11, unique: true, null: false
      t.string :name, limit: 14, null: false
      t.string :company_name, limit: 19
      t.timestamps
    end
  end
end
