FactoryBot.define do
  factory :store do
    name { Faker::Company.name }
    storekeeper { Faker::Name.name }
  end
end
