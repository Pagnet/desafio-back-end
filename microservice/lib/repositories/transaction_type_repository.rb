module Repositories
  class TransactionTypeRepository
    def self.find_by_numeric_type(numeric_type)
      TransactionType.where(["numeric_type = ?", numeric_type]).first
    end
  end
end
