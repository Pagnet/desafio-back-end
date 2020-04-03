# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    first_digits  { '1234' }
    last_digits   { '6789' }
  end
end
