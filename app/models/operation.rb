class Operation < ApplicationRecord

  # Associations

  belongs_to :store
  belongs_to :operation_type


  #  Validations

  validates :operation_type,
    :occurred_at,
    :value,
    :cpf,
    :card_number,
    :owner,
    :store,
    presence: true


  # Delegations

  delegate :title, :signal, :nature, to: :operation_type, prefix: true, allow_nil: true
end
