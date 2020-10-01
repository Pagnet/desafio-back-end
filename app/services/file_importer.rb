class FileImporter < ApplicationService
  def initialize(cnab_file)
    @cnab_file = cnab_file
  end

  def call
    normalize_file.each_line { |line| create_transaction(line) }
  end

  private

  attr_reader :cnab_file

  def normalize_file
    text = File.open(cnab_file.tempfile).read
    text.gsub!(/\r\n?/, "\n")

    text
  end

  def create_transaction(line)
    return if line.size != 81

    Transaction.find_or_create_by!(
      store: store(line),
      credit_card: credit_card(line),
      transaction_type: transaction_type(line),
      event_date_time: DateTime.parse("#{line[1...9]}T#{line[42...48]}-0300"),
      amount: line[9...19].to_i / 100,
      beneficiary_cpf: line[20...31]
    )
  end

  def transaction_type(line)
    TransactionType.find_by(key: line.first.to_i)
  end

  def store(line)
    Store.find_or_create_by!(
      owner_name: line[48...62].strip,
      name: line[62...81].strip
    )
  end

  def credit_card(line)
    CreditCard.find_or_create_by!(
      first_digits: line[30...34],
      last_digits: line[38...42]
    )
  end
end
