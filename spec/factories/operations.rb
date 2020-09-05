FactoryBot.define do
  factory :operation do
    operation_type { OperationType.find_by(code: OperationType.codes.keys.sample) }
    occurred_at { "2020-09-05 01:56:57 UTC" }
    value { 1.00 }
    cpf { "MyString" }
    card_number { "MyString" }
    owner { "MyString" }
    store

    trait :invalid do
      operation_type { nil }
    end
  end
end
