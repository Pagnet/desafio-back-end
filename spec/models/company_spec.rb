require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { Company.new }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:owner) }

  it { is_expected.to validate_numericality_of(:total) }

  it { is_expected.to validate_length_of(:name).is_at_most(19) }
  it { is_expected.to validate_length_of(:owner).is_at_most(14) }

  it { is_expected.to have_many(:transactions) }
end
