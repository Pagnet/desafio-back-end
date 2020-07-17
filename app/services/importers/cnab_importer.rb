module Importers
  class CnabImporter
    def perform(file_path)
      File.foreach(file_path) { |line| import_line(line) }
    end

    def import_line(line)
      parsed_transaction = line_parser(line)

    end

    def line_parser(line)
      OpenStruct.new(
        type: line[0].to_i,
        date: "#{line[1..4]}/#{line[5..6]}/#{line[7..8]}".to_date,
        amount: line[9..18].to_f / 100.0,
        cpf: line[19..29],
        card_number: line[30..41],
        hour: "#{line[42..43]}:#{line[44..45]}:#{line[46..47]}",
        storekeeper: line[48..61].strip,
        store: line[62..80].strip
      )
    end

  end
end
