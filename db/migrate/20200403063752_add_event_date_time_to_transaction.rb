class AddEventDateTimeToTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :event_date
    remove_column :transactions, :event_time

    add_column :transactions, :event_date_time, :datetime
  end
end
