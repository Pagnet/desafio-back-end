class Operation < ApplicationRecord

  # Associations

  belongs_to :store
  belongs_to :operation_type


  # Callbacks

  before_save :set_signed_value


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

  delegate :title, :nature, to: :operation_type, prefix: true, allow_nil: true

  private

  def set_signed_value
    self.signed_value = value * operation_type_operator
  end

  def operation_type_operator
    operation_type.input? ? 1 : -1
  end
end
