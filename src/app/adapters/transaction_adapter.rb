module TransactionAdapter

  def self.adapt(data, store_id: nil)
    {
        transaction_type_id: data[:type],
        date: DateTime.strptime("#{data[:date]} #{data[:time]} -03:00", '%Y%m%d %H%M%S %z'),
        total_amount: data[:value],
        cpf: data[:cpf],
        card_number: data[:card_number],
        store_id: store_id,
    }
  end

end