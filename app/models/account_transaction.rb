# == Schema Information
#
# Table name: account_transactions
#
#  id                  :bigint           not null, primary key
#  transaction_kind_id :bigint           not null
#  exec_date           :date
#  exec_time           :time
#  value_cents         :integer          default(0), not null
#  value_currency      :string           default("BRL"), not null
#  card                :string
#  cpf                 :string
#  company_id          :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class AccountTransaction < ApplicationRecord
  include Transaction::Events

  belongs_to :transaction_kind
  belongs_to :company

  monetize :value_cents

  validates :cpf, presence: true
end
