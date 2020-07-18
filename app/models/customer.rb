class Customer < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  validates :cpf, presence: true, uniqueness: true
end
