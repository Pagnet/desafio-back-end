class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :number, index: { unique: true }

      t.timestamps
    end
  end
end
