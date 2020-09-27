# frozen_string_literal: true

FactoryBot.define do
  factory :store_operation do
    operated_at { Time.current }
    amount { 100_000 }
    card { '1234****4567' }
    document { '658.883.750-04' }
    kind { StoreOperation.kinds[:credit] }
    store
  end
end
