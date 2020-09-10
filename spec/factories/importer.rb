FactoryBot.define do
  factory :importer do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'cnab_test.txt')) }

  end
end