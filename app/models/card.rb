class Card < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  validates :number, presence: true, uniqueness: true
end
