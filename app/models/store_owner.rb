class StoreOwner < ApplicationRecord
  belongs_to :store

  has_many :transactions
end
