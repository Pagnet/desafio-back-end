# == Schema Information
#
# Table name: cnab_imports
#
#  id         :bigint           not null, primary key
#  name       :string
#  file       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :cnab_import do
    file {  Rack::Test::UploadedFile.new("spec/factories/CNAB.txt", "text/plain")  }
  end
end
