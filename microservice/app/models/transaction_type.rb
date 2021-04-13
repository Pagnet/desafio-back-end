class TransactionType < ApplicationRecord
  validates_presence_of :numeric_type
  validates_presence_of :description
  validates_presence_of :operation_type
  validates_presence_of :signal

  enum operation_type: ["entrada", "saída"]
  validates :operation_type, inclusion: { in: ["entrada", "saída"] }

  enum signal: ["positive", "negative"]
  validates :signal, inclusion: { in: ["positive", "negative"] }

  has_many :transactions
end
