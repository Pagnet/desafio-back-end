require 'rails_helper'

RSpec.describe Store do
  subject {
    described_class.new(name: 'Anything', owner: 'Anyone')
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a owner" do
    subject.owner = nil
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    subject { described_class.new }

    it { is_expected.to have_many(:financial_entries).dependent(:destroy) }
  end

  describe 'constraints' do
    subject { described_class.new }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:owner) }
  end
end
