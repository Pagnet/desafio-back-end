class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :store
  belongs_to :store_owner
end
