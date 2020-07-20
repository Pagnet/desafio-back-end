FactoryBot.define do
  factory :customer do
    cpf { Faker::IDNumber.brazilian_citizen_number }
  end
end
