# == Schema Information
#
# Table name: account_balances
#
#  id             :bigint           not null, primary key
#  company_id     :bigint           not null
#  value_cents    :integer          default(0), not null
#  value_currency :string           default("BRL"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :account_balance do
    value_cents { 0 }
    association :company, factory: :company
  end
end
