FactoryBot.define do
  factory :cnab_file do
    filename { "MyString" }
    body { "MyText" }
  end

  factory :store do
    sequence(:name) { |n| "Loja #{n}" }
  end

  factory :store_owner do
    sequence(:name) { |n| "Responsável #{n}" }
    store
  end

  factory :transaction_type do
    sequence(:type_num)
    sequence(:description) { |n| "Transaction Type #{n}" }
    nature { ['income', 'outcome'].sample }
  end

  factory :transaction do
    transaction_type
    store
    store_owner
    occurred_at { Random.rand(0..30).days.ago }
    value { Random.rand(10..999_999) }
    cpf { "%.3d.%.3d.%.3d-%.2d" % [3, 3, 3, 2].map { |n| Random.rand(n) } }
    credit_card_number { "%.4d%.4d%.4d%.4d" % 1.upto(4).inject([]) {|acc,n| acc << Random.rand(9999)} }
  end
end
