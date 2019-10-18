class Store < ApplicationRecord
  has_many :transactions

  validates :name, presence: true
  validates :owner, presence: true

  def to_s
    name
  end

  def sum_transactions
    entrance = transactions.entrance.sum(:total_amount)
    outgoing = transactions.outgoing.sum(:total_amount)
    entrance - outgoing
  end
end
