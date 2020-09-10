FactoryBot.define do
  factory :transaction do
    kind { "input" }
    kind_description { "Débito" }
    processed_at { DateTime.now }
    amount { 20000 }
    cpf { "21322202022" }
    card { "4242****4242" }
    importer
    store
  end
end