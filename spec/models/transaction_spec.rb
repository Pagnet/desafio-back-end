require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:kind_description) }
  it { is_expected.to validate_presence_of(:processed_at) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:cpf) }
  it { is_expected.to validate_presence_of(:card) }

  it { is_expected.to belong_to(:store) }
  it { is_expected.to belong_to(:importer) }

  describe '#kind_text' do
    subject(:subject) { transaction.kind_text }

    context "return kind for human" do
      let(:transaction) { FactoryBot.create(:transaction, kind: "input") }

      it { is_expected.to eq("Entrada") }
    end
  end

  describe '#is_input?' do
    subject(:subject) { transaction.is_input? }
    context "when transaction is input" do
      let(:transaction) { FactoryBot.create(:transaction, kind: "input") }

      it { is_expected.to be_truthy }
    end

    context "when transaction is output" do
      let(:transaction) { FactoryBot.create(:transaction, kind: "output") }

      it { is_expected.to be_falsey }
    end
  end

  describe '#is_output?' do
    subject(:subject) { transaction.is_output? }
    context "when transaction is input" do
      let(:transaction) { FactoryBot.create(:transaction, kind: "input") }

      it { is_expected.to be_falsey }
    end

    context "when transaction is output" do
      let(:transaction) { FactoryBot.create(:transaction, kind: "output") }

      it { is_expected.to be_truthy }
    end
  end

  describe '#update_store_balance' do
    context 'when transaction is input' do
      let!(:store) { FactoryBot.create(:store, balance: 10000) }
      let!(:transaction) { FactoryBot.create(:transaction, kind: "input", amount: 10000, store: store) }

      it { expect(store.balance).to eq(20000) }
    end

    context 'when transaction is output' do
      let!(:store) { FactoryBot.create(:store, balance: 10000) }
      let!(:transaction) { FactoryBot.create(:transaction, kind: "output", amount: 10000, store: store) }

      it { expect(store.balance).to eq(0) }
    end
  end
end
