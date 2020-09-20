class CreateFinancialNegotiations < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_negotiations, id: :uuid do |t|
      t.string :negotiation_kind
      t.datetime :occurrence_at
      t.decimal :movement_value, precision: 18, scale: 2
      t.string :beneficiary_identifier
      t.string :credit_card
      t.references :shopkeeper, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
