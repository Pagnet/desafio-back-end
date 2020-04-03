# frozen_string_literal: true

# To handle with financial transactions
class Transaction < ApplicationRecord
  # Associations
  belongs_to :transaction_type
  belongs_to :credit_card
  belongs_to :store

  # Validations
  validates_presence_of :event_date_time, :amount, :beneficiary_cpf
end
