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
