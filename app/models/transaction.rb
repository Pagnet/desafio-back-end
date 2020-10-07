class Transaction < ApplicationRecord
  belongs_to :transaction_kind
  belongs_to :company

  monetize :value_cents
end
