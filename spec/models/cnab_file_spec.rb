require 'rails_helper'

RSpec.describe CnabFile, type: :model do
  it { is_expected.to validate_presence_of(:filename) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to have_many(:transactions) }
end
