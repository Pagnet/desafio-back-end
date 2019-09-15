require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:transaction_type) }
  it { is_expected.to belong_to(:store) }
  it { is_expected.to belong_to(:store_owner) }
end
