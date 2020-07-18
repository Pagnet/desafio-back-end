class Customer < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true
end
