class AddSignedValueToOperations < ActiveRecord::Migration[5.2]
  def change
    add_column :operations, :signed_value, :decimal, precision: 12, scale: 2
  end
end
