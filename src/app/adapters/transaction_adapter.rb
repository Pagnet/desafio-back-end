module TransactionAdapter

  def self.adapt_from_cnab(cnab_data, store: nil)
    {
        transaction_type_id: cnab_data[:type],
        date: DateTime.strptime("#{cnab_data[:date]} #{cnab_data[:time]} -03:00", '%Y%m%d %H%M%S %z'),
        total_amount: cnab_data[:value],
        cpf: cnab_data[:cpf],
        card_number: cnab_data[:card_number],
        store_id: store&.id,
    }
  end

end