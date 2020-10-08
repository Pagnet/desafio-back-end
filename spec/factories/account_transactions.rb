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
FactoryBot.define do
  factory :account_transaction do
    association :transaction_kind, factory: :transaction_kind
    exec_date { "2020-10-07" }
    exec_time { "18:33:51" }
    value_cents { 0 }
    card { "MyString" }
    cpf { "MyString" }
    association :company, factory: :company
  end
end
