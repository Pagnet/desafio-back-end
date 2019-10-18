class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :store

  scope :entrance, -> do
    joins(:transaction_type).merge(TransactionType.entrance)
  end

  scope :outgoing, -> do
    joins(:transaction_type).merge(TransactionType.outgoing)
  end
end
