class Transaction < ApplicationRecord
  belongs_to :store
  belongs_to :credit_card
  belongs_to :transaction_type

  validates_presence_of :event_date_time, :amount, :beneficiary_cpf

  delegate :last_digits, to: :credit_card, prefix: true
  delegate :first_digits, to: :credit_card, prefix: true
end
