class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :store

  validates :total_amount, presence: true, numericality: true
  validates :date, presence: true
  validates :transaction_type, presence: true
  validates :store, presence: true

  scope :entrance, -> do
    joins(:transaction_type).merge(TransactionType.entrance)
  end

  scope :outgoing, -> do
    joins(:transaction_type).merge(TransactionType.outgoing)
  end
end
