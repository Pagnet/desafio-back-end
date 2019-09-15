class Store < ApplicationRecord
  has_many :transactions
  has_many :store_owners

  validates :name, presence: true
end
