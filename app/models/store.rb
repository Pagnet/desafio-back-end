class Store < ApplicationRecord
  attribute :name,  :string
  attribute :owner, :string

  has_many :financial_entries, dependent: :destroy
  validates_presence_of :name, :owner
  validates_uniqueness_of :name, scope: :owner
end
