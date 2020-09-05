class AddErrorMessageToImporters < ActiveRecord::Migration[5.2]
  def change
    add_column :importers, :error_message, :text
  end
end
