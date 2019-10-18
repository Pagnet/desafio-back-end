class TransactionKind < ApplicationRecord
  validates :description, presence: true, uniqueness: { case_sensitive: false }
  validates_inclusion_of :signal, in: %w( + - )

  ENTRANCE = 1
  OUTGOING = 2

  def to_s
    description
  end
end
