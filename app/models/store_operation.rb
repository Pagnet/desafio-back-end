# frozen_string_literal: true

class StoreOperation < ApplicationRecord
  INCOMING_OPERATIONS = %i[debt credit loan sales ted doc].freeze
  OUTGOING_OPERATIONS = %i[boleto financing rent].freeze

  belongs_to :store

  enum kind: {
    debt: 1,
    boleto: 2,
    financing: 3,
    credit: 4,
    loan: 5,
    sales: 6,
    ted: 7,
    doc: 8,
    rent: 9
  }

  validates :operated_at, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :card, presence: true
  validates :document, presence: true
  validates :kind, presence: true

  delegate :name, to: :store, prefix: true

  def self.balance(collection)
    collection.inject(0) { |balance, operation| balance + operation.signed_amount }
  end

  def signed_amount
    (INCOMING_OPERATIONS.include?(kind.to_sym) ? amount : amount * - 1) / 100.0
  end
end
