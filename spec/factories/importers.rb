FactoryBot.define do
  factory :importer do
    status { :pending }
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'CNAB.txt')) }

    trait :invalid do
      status { nil }
      file { nil }
    end
  end
end
