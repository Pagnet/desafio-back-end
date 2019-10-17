class TransactionKind < ApplicationRecord
  validates :description, presence: true, uniqueness: { case_sensitive: false }
  validates_inclusion_of :signal, in: %w( + - )
end
