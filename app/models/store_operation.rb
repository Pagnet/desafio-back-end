# frozen_string_literal: true

class StoreOperation < ApplicationRecord
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
end
