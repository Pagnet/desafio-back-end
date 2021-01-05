# == Schema Information
#
# Table name: Transactions
#
#  id                   :bigint           not null, primary key
#  transaction_type_id  :bigint
#  store_id             :bigint
#  date                 :datetime  
#  amount               :decimal
#  cpf                  :string
#  card_number          :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_transactions_on_transaction_type_id  (transaction_type_id)
#  index_transactions_on_store_id  (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (transaction_type_id => transaction_type.id)
#  fk_rails_...  (store_id => store.id)
#

class Transaction < ApplicationRecord

  belongs_to :transaction_type
  belongs_to :store

  validates :amount, presence: true, numericality: true
  validates :store_id, :transaction_type_id, :cpf, :card_number, presence: true

  def self.fetch_amount_total(store_id)
    amount_total = 0
    transactions = Transaction.where(store_id: store_id)

    transactions.each do |transaction|

      case transaction.transaction_type.signal
      when 'negative'
        amount_total -= transaction.amount
      when 'positive'
        amount_total += transaction.amount
      end

    end

    return amount_total

  end

  def amount_signal_positive?
    self.transaction_type.signal == 'positive'
  end
end