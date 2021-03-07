class Transaction < ApplicationRecord
  validates_presence_of :document_number
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
end
