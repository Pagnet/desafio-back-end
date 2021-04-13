module UseCases
  module Transactions
    class List
      def self.execute
        transactions = Repositories::TransactionRepository.all_with_relations
        format_response(transactions)
      end

      def self.format_response(transactions)
        transactions.each do |transaction|
          transaction.signal = TransactionType
            .signals
            .keys[transaction.signal]
          transaction.operation_type = TransactionType
            .operation_types
            .keys[transaction.operation_type]
        end
      end
    end
  end
end
