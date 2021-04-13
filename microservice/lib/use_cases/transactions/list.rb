module UseCases
  module Transactions
    class List
      def self.execute
        Repositories::TransactionRepository.findAll
      end
    end
  end
end
