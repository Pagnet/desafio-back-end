class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :cpf, index: { unique: true }

      t.timestamps
    end
  end
end
