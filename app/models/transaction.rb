# frozen_string_literal: true
class Transaction < ApplicationRecord
  validates_presence_of :document_number, :paid_at, :kind
  validates_numericality_of :amount_in_cents
  enum kind: {
    debit: 1,
    bill: 2,
    financing: 3,
    credit: 4,
    loan: 5,
    sales: 6,
    ted: 7,
    doc: 8,
    rent: 9,
  }

  scope :positive, -> { where(kind: [:debit, :credit, :loan, :sales, :ted, :doc]) }
  scope :negative, -> { where(kind: [:bill, :financing, :rent]) }
  belongs_to :store
  
end
