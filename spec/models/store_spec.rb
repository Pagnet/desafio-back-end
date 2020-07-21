require 'rails_helper'

RSpec.describe Store, type: :model do
  it { is_expected.to have_many(:transactions) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  describe '#balance' do
    subject(:subject) { store.balance }

    context 'when the store does not have transactions' do
      let(:store) { create(:store) }

      it { is_expected.to be_zero }
    end

    context 'when the store does not have transactions' do
      let(:store) { create(:store) }
      let(:type_input) { create(:transaction_type, kind: :input) }
      let(:type_output) { create(:transaction_type, kind: :output) }

      let!(:transactions) do
        [create(:transaction, store: store, transaction_type: type_input, amount: 50),
         create(:transaction, store: store, transaction_type: type_input, amount: 50),
         create(:transaction, store: store, transaction_type: type_output, amount: 10)]
      end

      it { is_expected.to eq(90.0) }
    end
  end
end
