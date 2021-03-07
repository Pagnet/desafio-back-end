FactoryBot.define do
  factory :transaction do
    kind { 1 }
    paid_at { "" }
    amount_in_cents { "" }
    document_number { "12345678910" }
    card_number { "MyString" }
  end
end
