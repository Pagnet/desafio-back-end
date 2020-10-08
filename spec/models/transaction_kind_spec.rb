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
require "rails_helper"

RSpec.describe TransactionKind, type: :model do
end
