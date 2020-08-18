class Store < ApplicationRecord
  attribute :name,  :string
  attribute :owner, :string

  has_many :financial_entries
end
