FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "Store #{n}" }

    trait :invalid do
      name { nil }
    end
  end
end
