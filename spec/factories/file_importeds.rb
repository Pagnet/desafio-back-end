FactoryBot.define do
  factory :file_imported do
    file { Rack::Test::UploadedFile.new('spec/fixtures/files/CNAB.txt') }
  end
end
