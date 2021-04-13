module Repositories
  class TransactionRepository
    def self.findAll
      Transaction.all
    end

    def self.create(transactions)
      Transaction.create(transactions)
    end
  end
end
