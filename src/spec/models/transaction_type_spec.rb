require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  describe 'associations' do
    it { should belong_to(:transaction_kind) }
  end

  describe 'validations' do
    it { should validate_presence_of(:transaction_kind) }
    it { should validate_presence_of(:description) }
    it {  should validate_uniqueness_of(:description).case_insensitive }
  end

  describe '#to_s' do
    let(:type) { build(:transaction_type, description: 'Impostos') }
    it { expect(type.to_s).to eq 'Impostos' }
  end

  context "scopes" do
    describe "#entrance"
    describe "#outgoing"
  end

end
