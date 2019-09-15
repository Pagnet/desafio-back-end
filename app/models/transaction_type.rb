class TransactionType < ApplicationRecord
  enum nature: ['income', 'outcome']

  has_many :transactions

  validates :type_num, :description, :nature, presence: true
end
