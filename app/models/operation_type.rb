class OperationType < ApplicationRecord

  # Enums

  enum code: {
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

  enum nature: %i[input output]


  #  Validations

  ## Presence

  validates :code,
    :nature,
    presence: true

  ## Uniqueness

  validates :code,
    uniqueness: true


  # Helpers

  def title
    return if code.blank?
    I18n.t("activerecord.attributes.operation_type.codes.#{code}")
  end

  def signal
    input? ? '+' : '-'
  end
end
