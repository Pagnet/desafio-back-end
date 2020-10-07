FactoryBot.define do
  factory :transaction do
    transaction_kind { nil }
    company { nil }
    send_date { "2020-10-06" }
    send_time { "2020-10-06 21:58:26" }
    value { "" }
  end
end
