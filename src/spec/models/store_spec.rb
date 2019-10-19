require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'associations' do
    it { should have_many(:transactions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:owner) }
  end

  describe '#to_s' do
    let(:store) { build(:store, name: 'Lojão do Povo') }
    it { expect(store.to_s).to eq 'Lojão do Povo' }
  end

  describe '#sum_transactions' do
    let(:store) { build(:store, name: 'Lojão do Povo') }
    it {
       create(:transaction, :rent, store: store, total_amount: 1000)
       create(:transaction, :sales, store: store, total_amount: 250)
       expect(store.sum_transactions).to be -750
    }
  end
end
