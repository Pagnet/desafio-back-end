# frozen_string_literal: true

FactoryBot.define do
  factory :transaction_type do
    key { 3 }
    description { 'Financiamento' }
    movement_type { :output }
    icon_representation { '-' }
  end
end
