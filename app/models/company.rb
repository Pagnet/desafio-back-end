# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  owner_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :account_transactions
  has_one :account_balance

  after_create :create_balance

  private
    def create_balance
      AccountBalance.create(company_id: id, value_cents: 0)
    end
end
