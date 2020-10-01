class Transaction < ApplicationRecord
  belongs_to :store

  validates_presence_of :kind, :date_and_hour, :value, :cpf, :card_number

  validates :kind, :inclusion => 1..9

  after_create :set_store_balance

  POSITIVE_KIND = [1,4,5,6,7,8]

  def set_store_balance
    if POSITIVE_KIND.include? kind
      store.update(balance: store.balance + value)
    else
      store.update(balance: store.balance - value)
    end
  end
end