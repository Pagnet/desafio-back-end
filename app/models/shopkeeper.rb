class Shopkeeper < ApplicationRecord
  has_many :negotiations, class_name: 'FinancialNegotiation'
  validates :name, :representative, presence: true
  validates :name, uniqueness: true
end
