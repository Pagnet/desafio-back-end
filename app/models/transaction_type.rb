class TransactionType < ApplicationRecord
  enum nature: ['income', 'outcome']
end
