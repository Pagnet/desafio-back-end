# frozen_string_literal: true

# Credit card used in transactions
class CreditCard < ApplicationRecord
  # Associations
  has_many :transactions

  # Validations
  validates_presence_of :first_digits, :last_digits
end
