require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) { FactoryBot.build(:store) }

  # Association validations
  it { is_expected.to have_many(:transactions) }

  # Respond_to validations
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:owner_name) }
  it { is_expected.to respond_to(:transactions) }

  # Presence validations
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:owner_name) }
end
