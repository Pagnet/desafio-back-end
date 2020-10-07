class TransactionKind < ApplicationRecord
  validates :kind, presence: true, uniqueness: true
end
