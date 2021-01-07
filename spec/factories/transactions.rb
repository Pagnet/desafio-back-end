FactoryBot.define do
  factory :transaction do
    transaction_type  {create(:transaction_type_positive) }
    store { create(:store) }
    date { "2021-01-08 10:10:10" }
    amount { "9.99" }
    cpf {"01234567890"}
    card_number {"012345678901"}
  end
end