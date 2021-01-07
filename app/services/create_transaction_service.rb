class CreateTransactionService

  def initialize(parsed_record, store, transaction_type)
    if store.blank? || transaction_type.blank?
      return false
    end
    @parsed_record       = parsed_record
    @store_id            = store.id
    @transaction_type_id = transaction_type.id
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
      amount: (parsed_record[:amount].to_f / 100),
      cpf: parsed_record[:cpf],
      card_number: parsed_record[:card_number]
    }
  end

 
  def generate_datetime(date, time)
    DateTime.parse("#{date}#{time}")
  end

  def create_transaction(transaction_data)
    if Transaction.create(transaction_data)
      return true
    else
      return false
    end
  end
  
end