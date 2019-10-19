TRANSACTION_KINDS = [
    { id: 1, description: 'Entrada', signal: '+'},
    { id: 2, description: 'Saída', signal: '-'},
].freeze

FactoryBot.define do
  factory :transaction_kind do
    sample = TRANSACTION_KINDS.sample

    id { sample[:id] }
    description { sample[:description] }
    signal { sample[:signal] }

    trait :entrance do
      id { TRANSACTION_KINDS[0][:id] }
      description { TRANSACTION_KINDS[0][:description] }
      signal { TRANSACTION_KINDS[0][:signal] }
    end

    trait :outgoing do
      id { TRANSACTION_KINDS[1][:id] }
      description { TRANSACTION_KINDS[1][:description] }
      signal { TRANSACTION_KINDS[1][:signal] }
    end

  end
end
