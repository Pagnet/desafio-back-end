FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { 'fake-password' }

    trait :invalid do
      name { nil }
      email { nil }
    end
  end
end
