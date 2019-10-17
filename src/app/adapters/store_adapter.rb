module TransactionAdapter

  def self.adapt_from_cnab(cnab_data)
    {
        name: cnab_data[:store_name],
        owner: cnab_data[:store_owner],
    }
  end

end