class Store < ApplicationRecord
  validates_presence_of :owner, uniqueness: { case_sensitive: false }
  validates_presence_of :name, uniqueness: { case_sensitive: false }

  has_many :transactions
end
