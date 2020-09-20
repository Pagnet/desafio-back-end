FactoryBot.define do
  factory :shopkeeper do
    name { Faker::Company.name }
    representative { Faker::Name.name }
  end
end
