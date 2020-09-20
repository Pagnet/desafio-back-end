require 'rails_helper'

RSpec.describe FinancialNegotiation, type: :model do
  it { should belong_to(:shopkeeper) }
  it { should validate_presence_of(:negotiation_kind) }
  it { should validate_presence_of(:occurrence_at) }
  it { should validate_presence_of(:movement_value) }
  it { should validate_presence_of(:beneficiary_identifier) }
  it { should validate_presence_of(:credit_card) }
end
