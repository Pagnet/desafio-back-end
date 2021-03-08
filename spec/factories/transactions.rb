# frozen_string_literal: true
FactoryBot.define do
  factory :transaction do
    kind { 1 }
    paid_at { DateTime.now }
    amount_in_cents { 1293 }
    document_number { "12345678910" }
    card_number { "MyString" }

    store
  end
end
