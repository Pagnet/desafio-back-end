class AttachedFile
  class Processors
    class CnabParser < Base
      def process
        return add_error(:file_empty) if lines.blank?
        operation = Operations::Negotiations::Create.new
        operation.result = self.result
        negotiations = operation.call(grouped_by_content.deep_symbolize_keys)
        attached_file.metadata['resources'] = negotiations.data[:shopkeepers] if negotiations.success?
      end

      private

      def store(store_name)
        store_name.gsub(/(\-\s(MATRIZ|FILIAL))$/, '').squish
      end

      def grouped_by_content
        content_lines.group_by do |item|
          {
            name: item['store'],
            representative: item['store_representative']
          }
        end
      end

      def content_lines
        lines.map do |line|
          store_name = line[62..80].squish
          {
            'negotiation_kind' => transaction_types(line[0]),
            'occurrence_at' => date(line[1..8]),
            'movement_value' => divide_by_hundred(line[9..18].to_i),
            'beneficiary_identifier' => identifier_formatter(line[19..29]),
            'credit_card' => line[30..41],
            'hour_of_occurrence' => hour(line[42..47]),
            'store_representative' => line[48..61].squish,
            'store_name' => store_name,
            'store' => store(store_name)
          }
        end
      end

      def lines
        file.each_line.select {|line| line }
      end

      def file
        attached_file.read.string
      end

      def date(date)
        Date.parse(date).try(:strftime, '%d/%m/%Y') rescue nil
      end

      def hour(hour)
        hour.gsub(/(\d{2})(\d{2})(\d{2})/, '\1:\2:\3')
      end

      def identifier_formatter(identifier)
        identifier.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4')
      end

      def divide_by_hundred(number)
        number / 100
      end

      def transaction_types(key)
        {
          '1' => 'debit',
          '2' => 'billet',
          '3' => 'financing',
          '4' => 'credit',
          '5' => 'loan_receipt',
          '6' => 'sales',
          '7' => 'ted_receipt',
          '8' => 'doc_receipt',
          '9' => 'rent'
        }[key.to_s]
      end
    end
  end
end
