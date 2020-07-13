class CnabLineParser
  attr_reader :line

  TRANSACTION_TYPES = {
    1 => ['Débito', 'incoming'],
    2 => ['Boleto', 'outcoming'],
    3 => ['Financiamento', 'outcoming'],
    4 => ['Crédito', 'incoming'],
    5 => ['Recebimento Empréstimo', 'incoming'],
    6 => ['Vendas', 'incoming'],
    7 => ['Recebimento TED','incoming'],
    8 => ['Recebimento DOC', 'incoming'],
    9 => ['Aluguel', 'outcoming']
  } 

  def initialize(line)
    @line = line.force_encoding('UTF-8')
  end

  def occurrence_datetime
    date = Date.parse(@line[1..8])
    time = Time.parse(@line[42..47].gsub(/\d{2}/, '\&:'))
    Time.zone.parse("#{date.strftime('%F')} #{time.strftime('%T')}")
  end

  def value
    @line[9..18].to_i / 100
  end

  def beneficiary_document
    @line[19..29]
  end

  def credit_card_number
    @line[30..41]
  end

  def type
    transaction_type = TRANSACTION_TYPES[@line[0].to_i]
    
    {
      description: transaction_type[0],
      kind: transaction_type[1]
    }
  end

  def store
    {
      name: @line[62..80].strip.titleize,
      owner_name: @line[48..61].strip.titleize
    }
  end
end