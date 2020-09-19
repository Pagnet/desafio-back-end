class CreateAttachedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :attached_files, id: :uuid do |t|
      t.string :filename, null: false
      t.string :filepath, null: false
      t.string :kind, null: false
      t.string :status, null: false, default: 'pending'

      t.json :metadata
      t.datetime :processed_at

      t.timestamps
    end
  end
end
