class Store < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
