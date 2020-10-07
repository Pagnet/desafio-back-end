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
    return if line.nil?

    extract
  end

  def extract
    {
      kind: line[0],
      ocurred_date: line[1..8],
      value: line[9..18],
      cpf: line[19..29],
      ocurred_time: line[42..47],
      store_owner: line[48..61].strip,
      store_name: line[62..80].strip
    }
  end

  def normalize_date
  end
end
