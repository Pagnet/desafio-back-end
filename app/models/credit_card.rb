class CreditCard < ApplicationRecord
  has_many :transactions

  validates_presence_of :first_digits, :last_digits
end
