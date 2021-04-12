class TransactionType < ApplicationRecord
  validates_presence_of :numeric_type
  validates_presence_of :description
  validates_presence_of :operation_type
  validates_presence_of :signal

  enum operation_type: ["Entrada", "Saída"]
  validates :operation_type, inclusion: { in: ["Entrada", "Saída"] }

  enum signal: ["Positive", "Negative"]
  validates :signal, inclusion: { in: ["Positive", "Negative"] }
end
