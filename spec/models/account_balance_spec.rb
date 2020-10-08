# == Schema Information
#
# Table name: account_balances
#
#  id             :bigint           not null, primary key
#  company_id     :bigint           not null
#  value_cents    :integer          default(0), not null
#  value_currency :string           default("BRL"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "rails_helper"

RSpec.describe AccountBalance, type: :model do
end
