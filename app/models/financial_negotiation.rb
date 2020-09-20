class FinancialNegotiation < ApplicationRecord
  belongs_to :shopkeeper

  validates :negotiation_kind, :movement_value,
            :beneficiary_identifier, :credit_card,
            presence: true
end
