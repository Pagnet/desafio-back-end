class Operation < ApplicationRecord

  # Enums

  enum operation_type: {
    debit: 1,
    bank_slip: 2,
    financing: 3,
    credit: 4,
    loan: 5,
    sales: 6,
    ted: 7,
    doc: 8,
    rent: 9
  }


  # Associations

  belongs_to :store


  #  Validations

  validates :operation_type,
    :occurred_at,
    :value,
    :cpf,
    :card_number,
    :owner,
    :store,
    presence: true
end
