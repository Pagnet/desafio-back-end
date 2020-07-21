require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to have_many(:transactions) }

  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_uniqueness_of(:number) }
end
