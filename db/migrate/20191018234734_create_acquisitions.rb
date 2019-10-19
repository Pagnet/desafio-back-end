class CreateAcquisitions < ActiveRecord::Migration[5.2]
  def change
    create_table :acquisitions do |t|
      t.integer :type
      t.decimal :value
      t.datetime :date

      t.timestamps
    end
  end
end
