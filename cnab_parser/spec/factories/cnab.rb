# frozen_string_literal: true

FactoryBot.define do
  factory :cnab do
    cnab_type { (0..9).to_a.sample }
    date { Faker::Time.backward(days: 14, period: :evening) }
    value { Faker::Number.decimal(l_digits: 2) }
    document { Faker::CPF.number }
    card { mask_card }
    store
    user
  end
end

def mask_card
  card_number = Faker::Finance.credit_card
  "#{card_number[0, 4]}****#{card_number[-4..-1]}"
end