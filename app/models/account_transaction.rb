class AccountTransaction < ApplicationRecord
  belongs_to :transaction_kind
  belongs_to :company

  validates :cpf, presence: true
end
