class AddCompanyRefToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :company, null: false, foreign_key: true
  end
end
