TRANSACTION_TYPES = [
    { id: 1, description: 'Débito', transaction_kind_id: 1 },
    { id: 2, description: 'Boleto', transaction_kind_id: 2 },
    { id: 3, description: 'Financiamento', transaction_kind_id: 2 },
    { id: 4, description: 'Crédito', transaction_kind_id: 1 },
    { id: 5, description: 'Recebimento Empréstimo', transaction_kind_id: 1 },
    { id: 6, description: 'Vendas', transaction_kind_id: 1 },
    { id: 7, description: 'Recebimento TED', transaction_kind_id: 1 },
    { id: 8, description: 'Recebimento DOC', transaction_kind_id: 1 },
    { id: 9, description: 'Aluguel', transaction_kind_id: 2 },

].freeze

FactoryBot.define do
  factory :transaction_type do
    sample = TRANSACTION_TYPES.sample

    id { sample[:id] }
    description { sample[:description] }
    transaction_kind { sample[:transaction_kind_id] == 1 ?
                          FactoryBot.find_or_create(:transaction_kind, :entrance) :
                          FactoryBot.find_or_create(:transaction_kind, :outgoing) }


    trait :debit do
      id { TRANSACTION_TYPES[0][:id] }
      description { TRANSACTION_TYPES[0][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :entrance) }
    end

    trait :payment_slip do
      id { TRANSACTION_TYPES[1][:id] }
      description { TRANSACTION_TYPES[1][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :outgoing) }
    end

    trait :financing do
      id { TRANSACTION_TYPES[2][:id] }
      description { TRANSACTION_TYPES[2][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :outgoing) }
    end

    trait :credit do
      id { TRANSACTION_TYPES[3][:id] }
      description { TRANSACTION_TYPES[3][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :entrance) }
    end

    trait :loan_receipt do
      id { TRANSACTION_TYPES[4][:id] }
      description { TRANSACTION_TYPES[4][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :entrance) }
    end

    trait :sales do
      id { TRANSACTION_TYPES[5][:id] }
      description { TRANSACTION_TYPES[5][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :entrance) }
    end

    trait :ted_receipt do
      id { TRANSACTION_TYPES[6][:id] }
      description { TRANSACTION_TYPES[6][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :entrance) }
    end

    trait :doc_receipt do
      id { TRANSACTION_TYPES[7][:id] }
      description { TRANSACTION_TYPES[7][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :entrance) }
    end

    trait :rent do
      id { TRANSACTION_TYPES[8][:id] }
      description { TRANSACTION_TYPES[8][:description] }
      transaction_kind { FactoryBot.find_or_create(:transaction_kind, :outgoing) }
    end

  end

end
