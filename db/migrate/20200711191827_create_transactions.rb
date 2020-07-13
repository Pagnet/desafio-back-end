class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :transactions do |t|
      t.references :imported_file, index: true, null: false
      t.datetime :occurrence_datetime, null: false
      t.integer :value, null: false
      t.string :beneficiary_document, null: false
      t.string :credit_card_number, null: false
      t.hstore :type_info, default: { description: nil, kind: nil }
      t.hstore :store_info, default: { name: nil, owner_name: nil }

      t.timestamps
    end
  end
end
