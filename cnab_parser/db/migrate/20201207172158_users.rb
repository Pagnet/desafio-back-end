# frozen_string_literal: true

class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 14

      t.timestamps
    end

    add_index :users, :name, unique: true
  end
end
