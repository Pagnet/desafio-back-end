class TransactionType < ApplicationRecord
  enum kind: { input: 0, output: 1 }

  has_many :transactions, dependent: :restrict_with_exception
  validates :description, :kind, presence: true
end
