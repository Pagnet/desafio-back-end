# == Schema Information
#
# Table name: TransactionTypes
#
#  id          :bigint           not null, primary key
#  sort        :integer
#  description :string     
#  kind        :string
#  signal      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TransactionType < ApplicationRecord

  has_many :transactions

  validates :sort, :description, :kind, :signal, presence: true

  enum kind: {output: 0, input: 1}
  enum signal: {negative: 0, positive: 1}

end