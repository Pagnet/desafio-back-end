class TransactionType < ApplicationRecord
  belongs_to :transaction_kind

  validates :description, presence: true, uniqueness: { case_sensitive: false }
  validates :transaction_kind, presence: true
end
