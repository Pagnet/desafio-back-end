class Store < ApplicationRecord
  validates :name, :shopkeeper, presence: true

  has_many :transactions
end
