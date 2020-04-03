# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name        { 'JOÃO MACEDO' }
    owner_name  { 'BAR DO JOÃO' }

    factory :store_with_many_transaction do
      after(:create) do |store|
        transaction_type = TransactionType.first || FactoryBot.create(:transaction_type)
        credit_card = CreditCard.first || FactoryBot.create(:credit_card)

        FactoryBot.create_list(:transaction, 5,
                               store: store,
                               transaction_type: transaction_type,
                               credit_card: credit_card)
      end
    end
  end
end
