FactoryBot.define do
  factory :transaction do
    transaction_type { FactoryBot.find_or_create(:transaction_type, **TRANSACTION_TYPES.sample) }
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    total_amount { (10..5000).to_a.sample }
    cpf { "12345678911" }
    card_number { "********78900987" }
    store { create(:store) }

    trait :debit do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :debit) }
    end

    trait :payment_slip do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :payment_slip) }
    end

    trait :financing do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :financing) }
    end

    trait :credit do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :credit) }
    end

    trait :loan_receipt do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :loan_receipt) }
    end

    trait :sales do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :sales) }
    end

    trait :ted_receipt do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :ted_receipt) }
    end

    trait :doc_receipt do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :doc_receipt) }
    end

    trait :rent do
      transaction_type { FactoryBot.find_or_create(:transaction_type, :rent) }
    end
  end
end
