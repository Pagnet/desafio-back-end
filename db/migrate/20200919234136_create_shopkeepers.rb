class CreateShopkeepers < ActiveRecord::Migration[6.0]
  def change
    create_table :shopkeepers, id: :uuid do |t|
      t.string :name
      t.string :representative
      t.decimal :total_balance, precision: 18, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
