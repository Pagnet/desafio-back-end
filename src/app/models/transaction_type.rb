class TransactionType < ApplicationRecord
  belongs_to :transaction_kind

  validates :description, presence: true, uniqueness: { case_sensitive: false }
  validates :transaction_kind, presence: true

  def to_s
    description
  end

  scope :entrance, -> do
    where(transaction_kind_id: TransactionKind::ENTRANCE)
  end

  scope :outgoing, -> do
    where(transaction_kind_id: TransactionKind::OUTGOING)
  end
end
