class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.date :occurence_date
      t.numeric :amount
      t.string :cpf
      t.numeric :card_number
      t.time :occurrence_time

      t.timestamps
    end
  end
end
