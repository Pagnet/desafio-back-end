FactoryBot.define do
  factory :store do
    name { Faker::Commerce.department }
    owner { Faker::Name.name }
  end
end
