class Store < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name, :owner_name
end
