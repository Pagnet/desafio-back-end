class Company < ApplicationRecord
  validates :owner, presence: true, length: { maximum: 14 }
  validates :name, presence: true, length: { maximum: 19 }
  validates :total, numericality: true

  has_many :transactions, -> { order(:date) }
end
