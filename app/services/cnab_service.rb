require "cpf_cnpj"

class CnabService
  attr_reader :line

  def initialize(line = nil)
    @line = line
  end

  def self.build(line)
    new(line).build
  end

  def build
    return AccountTransaction.new if line.nil?

    extract
  end

  def extract
    cpf = CPF.generate(line[19..29])
    kind = build_transaction_kind
    {
      transaction_kind_id: kind.id,
      exec_date: normalize_date,
      value_cents: normalize_value(kind.multiplier),
      cpf: cpf,
      card: line[30..41],
      exec_time: normalize_time,
      company_id: build_company
    }
  end

  private
    def build_company
      Company.find_by(owner_name: line[48..61].strip, name: line[62..80].strip).try(:id)
    end

    def build_transaction_kind
      TransactionKind.find_by(kind: line[0])
    end

    def normalize_value(multiplier)
      line[9..18].to_i * multiplier
    end

    def normalize_date
      Date.parse(line[1..8]).strftime("%d-%m-%Y")
    end

    def normalize_time
      Time.parse("#{line[42..43]}:#{line[44..45]}:#{line[46..47]}").strftime("%H:%M:%S")
    end

    def normalize_cpf
    end
end
