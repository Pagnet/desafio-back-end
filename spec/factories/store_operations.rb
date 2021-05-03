FactoryBot.define do
  factory :store_operation do
    operated_at { "2021-05-02 01:09:40" }
    amount { 1 }
    card { "MyString" }
    document { "MyString" }
    kind { 1 }
  end
end
