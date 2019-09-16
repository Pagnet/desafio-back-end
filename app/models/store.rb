class Store < ApplicationRecord
  has_many :transactions
  has_many :store_owners

  validates :name, presence: true

  def balance
    transactions.inject(0) do |acc, transaction|
      if transaction.outcome?
        acc -= transaction.value
      else
        acc += transaction.value
      end
    end
  end
end
