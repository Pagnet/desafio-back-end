class Store < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true

  def balance
    total_by_kinds = transactions.joins(:transaction_type).group(:kind).sum(:amount)
    inputs = total_by_kinds[TransactionType.kinds[:input]] || 0
    outputs = total_by_kinds[TransactionType.kinds[:output]] || 0
    inputs - outputs
  end
end
