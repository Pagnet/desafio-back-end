class CnabParser

  attr_reader :file

  def initialize(path)
    @file = File.open(path)
  end

  def call
    file.readlines.map do |row|
      {
        operation_type: operation_type(row),
        occurred_at: occurred_at(row),
        value: value(row),
        cpf: cpf(row),
        card_number: card_number(row),
        owner: owner(row),
        store: store(row)
      }
    end
  end

  def operation_type(row)
    Operation.operation_types.key(row[0].to_i).to_sym
  end

  def occurred_at(row)
    Time.parse("#{row[1,4]}-#{row[5,2]}-#{row[7,2]} #{row[42,2]}:#{row[44,2]}:#{row[46,2]} UTC")
  end

  def value(row)
    "#{operation_signal(row)}#{row[9,8]}.#{row[17, 2]}".to_f
  end

  def cpf(row)
    row[19..29]
  end

  def card_number(row)
    row[30..41]
  end

  def owner(row)
    row[48..61].strip
  end

  def store(row)
    row[62..80].strip
  end

  def operation_signal(row)
    operation_input?(operation_type(row)) ? '+' : '-'
  end

  def operation_input?(operation_type)
    %i[
      debit
      credit
      loan
      sales
      ted
      doc
    ].include? operation_type
  end
end
