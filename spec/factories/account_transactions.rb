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
    transaction_kind { nil }
    exec_date { "2020-10-07" }
    exec_time { "2020-10-07 18:33:51" }
    value { "" }
    card { "MyString" }
    cpf { "MyString" }
    company { nil }
  end
end
