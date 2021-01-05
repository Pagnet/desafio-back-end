# == Schema Information
#
# Table name: Store
#
#  id          :bigint           not null, primary key
#  name        :string
#  owner       :string     
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Store < ApplicationRecord

  has_many :transactions

  validates :name, :owner, presence: true

end