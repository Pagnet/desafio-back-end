class CreateTransactionService

  def initialize(parsed_record, store_id, transaction_type_id)
    @parsed_record       = parsed_record
    @store_id            = store_id
    @transaction_type_id = transaction_type_id
  end

  def self.build(parsed_record, store_id, transaction_type_id)
    new(parsed_record, store_id, transaction_type_id).perform
  end

  def perform
    transaction_data = transaction_data(@parsed_record, @store_id, @transaction_type_id)
    return create_transaction(transaction_data)
  end

  private

  def transaction_data(parsed_record, store_id, transaction_type_id)
    {
      transaction_type_id: transaction_type_id,
      store_id: store_id,
      date: generate_datetime(parsed_record[:date], parsed_record[:time]),
      amount: parsed_record[:amount],
      cpf: parsed_record[:cpf],
      card_number: parsed_record[:card_number]
    }
  end

 
  def generate_datetime(date, time)
    DateTime.strptime("#{date} #{time} -03:00", '%Y%m%d %H%M%S %z')
  end

  def create_transaction(transaction_data)
    Transaction.create!(transaction_data) rescue false
  end

end