class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :kind
      t.string :kind_description
      t.datetime :processed_at
      t.bigint :amount
      t.string :cpf
      t.string :card
      t.references :store
      t.references :importer
      t.timestamps
    end
  end
end
