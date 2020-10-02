class Transaction < ApplicationRecord
  validates :type, presence: true, numericality: { only_integer: true }
  validates :date, presence: true, length: { is: 10 }
  validates :value, presence: true, numericality: true
  validates :cpf, presence: true, length: { is: 14 }
  validates :credit_card, presence: true, length: { is: 12 }
  validates :time, presence: true, length: { is: 8 }
  validates :company, presence: true, length: { maximum: 14 }
  validates :owner, presence: true, length: { maximum: 19 }
end
