class ChangeCpfSizeInTransactions < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :cpf, :string, :limit => 11
  end
end
