# == Schema Information
#
# Table name: account_transactions
#
#  id                  :bigint           not null, primary key
#  transaction_kind_id :bigint           not null
#  exec_date           :date
#  exec_time           :time
#  value_cents         :integer          default(0), not null
#  value_currency      :string           default("BRL"), not null
#  card                :string
#  cpf                 :string
#  company_id          :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe AccountTransaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
