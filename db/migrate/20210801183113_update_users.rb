class UpdateUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider, :string, limit: 50, null: false, default: ''
    add_column :users, :uid, :string, limit: 500, null: false, default: ''
  end
end
