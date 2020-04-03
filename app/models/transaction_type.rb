# frozen_string_literal: true

# To handle financial transaction types
class TransactionType < ApplicationRecord
  enum movement_type: %i[input output]

  # Associations
  has_many :transactions

  # Validations
  validates_presence_of :key, :description, :movement_type, :icon_representation
  validates_uniqueness_of :key
end
