class TransactionType < ApplicationRecord
  enum kind: { input: 0, output: 1 }

  validates :description, :kind, presence: true
end
