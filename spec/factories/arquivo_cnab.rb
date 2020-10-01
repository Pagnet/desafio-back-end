FactoryBot.define do
  factory :arquivo_cnab do
    documento {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/support/arquivos/arquivo_cnabs/CNAB.txt'), "text/plain")}
  end
end
