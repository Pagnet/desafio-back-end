module CnabAdapter

  def self.adapt(line)
    {
        type: line[0].to_i,
        date: line[1..8],
        value: (line[9..18].to_i / 100),
        cpf: line[19..29],
        card_number: line[30..41],
        time: line[42..47],
        store_owner: line[48..61].strip,
        store_name: line[62..80].strip
    }
  end

end