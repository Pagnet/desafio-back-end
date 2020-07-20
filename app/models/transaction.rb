class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :customer
  belongs_to :card
  belongs_to :store

  validates :transaction_type, :customer, :card, :store, :amount, :processed_at, presence: true
end
