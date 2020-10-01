class Store < ApplicationRecord
  has_many :transactions

  validates_presence_of :owner_name, :name 
end
