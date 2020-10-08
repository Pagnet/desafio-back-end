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
    name { "MyString" }
    file { "MyString" }
  end
end
