FactoryBot.define do
  factory :transaction_kind do
    kind { 1 }
    description { "MyString" }
    nature { "MyString" }
    signal { "MyString" }
  end
end
