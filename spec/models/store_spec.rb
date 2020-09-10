require 'rails_helper'

RSpec.describe Store, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:shopkeeper) }

  it { is_expected.to have_many(:transactions) }

  describe '#balance' do
    subject(:subject) { store.balance }

    context 'when the store not have transactions' do
      let(:store) { FactoryBot.create(:store) }

      it { is_expected.to be_zero }
    end

    context 'when the store have transactions' do
      let(:store) { FactoryBot.create(:store) }
      let!(:transaction_1) { FactoryBot.create(:transaction, kind: "input", kind_description: "Débito", amount: 200, store: store) }
      let!(:transaction_2) { FactoryBot.create(:transaction, kind: "input", kind_description: "Débito", amount: 600, store: store) }
      let!(:transaction_3) { FactoryBot.create(:transaction, kind: "output", kind_description: "Financiamento", amount: 55000, store: store) }
      let!(:transaction_4) { FactoryBot.create(:transaction, kind: "input", kind_description: "Vendas", amount: 220000, store: store) }

      it { is_expected.to eq(165800) }
    end
  end
end
