# frozen_string_literal: true

class Stores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, limit: 19

      t.timestamps
    end

    add_index :stores, :name, unique: true
  end
end
