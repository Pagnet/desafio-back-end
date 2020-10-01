class TransactionType < ApplicationRecord
  enum movement_type: %i[input output]

  has_many :transactions

  validates_presence_of :description, :key, :icon_representation, :movement_type
  validates_uniqueness_of :key
end
