class CnabFile < ApplicationRecord
  validates :filename, :body, presence: true

  has_many :transactions
end
