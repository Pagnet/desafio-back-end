FactoryBot.define do
  factory :card do
    number { Faker::Finance.credit_card }
  end
end
