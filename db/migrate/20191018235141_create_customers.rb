class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :cpf
      t.integer :card
      t.time :time

      t.timestamps
    end
  end
end
