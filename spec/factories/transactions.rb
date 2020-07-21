FactoryBot.define do
  factory :transaction do
    transaction_type
    customer
    card
    store
    processed_at { "2020-07-18 15:25:31" }
    amount { 10.5 }
  end
end
