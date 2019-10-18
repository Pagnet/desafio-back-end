require_relative 'import_transaction_error'

class ImportTransactionJob < ApplicationJob
  queue_as :default

  def perform(line)
    parsed_line = parse(line)

    ActiveRecord::Base.transaction do
      store_data = StoreAdapter.adapt(parsed_line)
      store = find_store(store_data) || create_store(store_data)

      transaction_data = TransactionAdapter.adapt(parsed_line, store_id: store.id)
      create_transaction(transaction_data) unless transaction_exists?(transaction_data)
    end
  end

  def parse(line)
    parsed = {
        type: (line[0].to_i rescue nil),
        date: line[1..8],
        value: ((line[9..18].to_i / 100) rescue nil),
        cpf: line[19..29],
        card_number: line[30..41],
        time: line[42..47],
        store_owner: line[48..61].strip,
        store_name: line[62..80].strip
    }

    error('line does not contain valid type', line) unless (1..9).to_a.include?(parsed[:type])
    error('line does not contain valid date', line) unless is_date?(parsed[:date])
    error('line does not contain valid time', line) unless is_date?(parsed[:time])
    error('line does not contain valid cpf', line) unless is_number?(parsed[:cpf])
    error('line does not contain valid value', line) unless is_number?(parsed[:value])
    error('line does not contain valid store_owner', line) unless parsed[:store_owner].present?
    error('line does not contain valid store_name', line) unless parsed[:store_name].present?

    parsed
  end

  def error(error, line)
    raise ImportTransactionError.new(error, raw: line)
  end

  def is_number?(string)
    true if Float(string) rescue false
  end

  def is_date?(string)
    true if DateTime.strptime(string, '%H%M%S') rescue false
  end

  def is_time?(string)
    true if DateTime.strptime(string, '%Y%m%d') rescue false
  end

  def find_store(store_data)
    Store.find_by(**store_data.slice(:name))
  end

  def create_store(store_data)
    Store.create!(store_data)
  end

  def create_transaction(transaction_data)
    Transaction.create!(transaction_data)
  end

  def transaction_exists?(transaction_data)
    Transaction.where(**transaction_data).exists?
  end

end
