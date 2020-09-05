class CnabParser

  attr_reader :file

  def initialize(path)
    @file = File.open(path)
  end

  def call
    file.readlines.map do |row|
      {
        type: row[0].strip,
        date: row[1..8].strip,
        value: row[9..18].strip,
        cpf: row[19..29].strip,
        card_number: row[30..41].strip,
        time: row[42..47].strip,
        owner: row[48..61].strip,
        store: row[62..80].strip
      }
    end
  end
end
