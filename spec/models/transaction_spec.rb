require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:transaction_type) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to belong_to(:card) }
  it { is_expected.to belong_to(:store) }

  it { is_expected.to validate_presence_of(:transaction_type) }
  it { is_expected.to validate_presence_of(:customer) }
  it { is_expected.to validate_presence_of(:card) }
  it { is_expected.to validate_presence_of(:store) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:processed_at) }
end
