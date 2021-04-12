module Repositories
  class TransactionRepository
    def self.create(transactions)
      Transaction.create(transactions)
    end
  end
end
