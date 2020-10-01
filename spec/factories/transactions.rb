FactoryBot.define do
  factory :transaction do
    association :transaction_type
    association :store
    association :credit_card

    event_date_time     { DateTime.now }
    amount              { 100 }
    beneficiary_cpf     { '12345678900' }
  end
end
