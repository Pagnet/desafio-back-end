# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    association :store, factory: :store
    association :credit_card, factory: :credit_card

    transaction_type_id { 1 }
    event_date          { Date.today }
    event_time          { Time.now }
    amount              { 100 }
    beneficiary_cpf     { '12345678900' }
  end
end
