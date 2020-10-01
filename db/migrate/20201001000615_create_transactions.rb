class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :store, foreign_key: true
      t.integer :kind
      t.datetime :date_and_hour
      t.decimal :value
      t.string :cpf
      t.string :card_number

      t.timestamps
    end
  end
end
