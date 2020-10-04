class Transaction < ApplicationRecord
  validates :transaction_type, presence: true, numericality: { only_integer: true }
  validates :date, presence: true
  validates :value, presence: true, numericality: true
  validates :cpf, presence: true, length: { is: 14 }
  validates :credit_card, presence: true, length: { is: 12 }

  belongs_to :company
end
