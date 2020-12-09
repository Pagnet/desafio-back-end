# frozen_string_literal: true

class Cnabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cnabs do |t|
      t.integer :cnab_type, limit: 1
      t.datetime :date
      t.float :value
      t.string :document, limit: 11
      t.string :card, limit: 12
      t.string :file_name

      t.timestamps

      t.index %i[file_name document value date], unique: true
    end
  end
end
