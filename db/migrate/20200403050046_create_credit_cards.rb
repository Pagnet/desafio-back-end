class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :first_digits
      t.string :last_digits

      t.timestamps
    end
  end
end
