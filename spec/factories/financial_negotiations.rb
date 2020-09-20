FactoryBot.define do
  factory :financial_negotiation do
    negotiation_kind { Faker::Company.name }
    occurrence_at { Faker::Name.name }
    movement_value { Faker::Name.name }
    beneficiary_identifier { Faker::Name.name }
    credit_card { Faker::Name.name }
    association :shopkeeper
  end
end
