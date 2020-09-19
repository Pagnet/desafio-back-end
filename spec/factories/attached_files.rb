FactoryBot.define do
  factory :attached_file do
    filename { "#{SecureRandom.uuid}.txt" }
    kind { 'CNAB' }
    processed_at { Time.current }
  end
end
