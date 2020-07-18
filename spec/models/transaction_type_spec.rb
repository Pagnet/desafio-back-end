require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  it { is_expected.to have_many(:transactions) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:kind) }
end
