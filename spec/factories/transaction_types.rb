FactoryBot.define do
  factory :transaction_type_positive, class: TransactionType do
    sort  {1}
    description { "Débito" }
    kind { "input" }
    signal {"positive"}
  end

  factory :transaction_type_negative, class: TransactionType do
    sort  {2}
    description { "Boleto" }
    kind { "input" }
    signal {"negative"}
  end
end