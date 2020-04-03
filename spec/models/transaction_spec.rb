require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { FactoryBot.build(:transaction) }

  # Association validations
  it { is_expected.to belong_to(:transaction_type) }
  it { is_expected.to belong_to(:store) }
  it { is_expected.to belong_to(:credit_card) }

  # Respond_to validations
  it { is_expected.to respond_to(:event_date_time) }
  it { is_expected.to respond_to(:amount) }
  it { is_expected.to respond_to(:beneficiary_cpf) }
  it { is_expected.to respond_to(:transaction_type) }
  it { is_expected.to respond_to(:store) }
  it { is_expected.to respond_to(:credit_card) }

  # Presence validations
  it { is_expected.to validate_presence_of(:event_date_time) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:beneficiary_cpf) }
end
