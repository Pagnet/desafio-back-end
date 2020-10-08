# == Schema Information
#
# Table name: transaction_kinds
#
#  id          :bigint           not null, primary key
#  kind        :integer
#  description :string
#  nature      :string
#  signal      :string
#  multiplier  :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :transaction_kind do
    kind { 1 }
    description { "MyString" }
    nature { "MyString" }
    signal { "MyString" }
    multiplier { 1 }
  end
end
