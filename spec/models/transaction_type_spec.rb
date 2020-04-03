require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  # Association validations
  it { is_expected.to have_many(:transactions) }

  # Respond_to validations
  it { is_expected.to respond_to(:key) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:movement_type) }
  it { is_expected.to respond_to(:icon_representation) }
  it { is_expected.to respond_to(:transactions) }

  # Presence validations
  it { is_expected.to validate_presence_of(:key) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:movement_type) }
  it { is_expected.to validate_presence_of(:icon_representation) }

  # Uniqueness validations
  it { is_expected.to validate_uniqueness_of(:key) }
end
