require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  let(:credit_card) { FactoryBot.build(:credit_card) }

  # Association validations
  it { is_expected.to have_many(:transactions) }

  # Respond_to validations
  it { is_expected.to respond_to(:first_digits) }
  it { is_expected.to respond_to(:last_digits) }
  it { is_expected.to respond_to(:transactions) }

  # Presence validations
  it { is_expected.to validate_presence_of(:first_digits) }
  it { is_expected.to validate_presence_of(:last_digits) }
end
