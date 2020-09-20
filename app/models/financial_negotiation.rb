class FinancialNegotiation < ApplicationRecord
  belongs_to :shopkeeper

  validates :negotiation_kind, :occurrence_at, :movement_value,
            :beneficiary_identifier, :credit_card, :hour_of_occurrence,
            presence: true
end
