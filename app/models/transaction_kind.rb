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
class TransactionKind < ApplicationRecord
  validates :kind, presence: true, uniqueness: true

  before_save :set_multiplier

  private
    def set_multiplier
      self.multiplier = signal === "+" ? 1 : -1
    end
end
