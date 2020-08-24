FactoryBot.define do
  factory :financial_entry do
    kind { FinancialEntry.kinds.keys.sample }
    transaction_date { Faker::Date.backward }
    transaction_time { Faker::Time.backward }
    amount { Faker::Number.decimal(r_digits: 2) }
    social_number { Faker::IDNumber.brazilian_citizen_number }
    card_number { Faker::Finance.credit_card }
    store
  end
end
