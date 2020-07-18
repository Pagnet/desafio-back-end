require 'rails_helper'

RSpec.describe Importers::CnabImporter do
  describe '#import_transaction' do
    subject(:transaction) { described_class.new.import_transaction(line) }

    let!(:transaction_type) { create(:transaction_type, id: 1) }
    let(:line) { '1201903010000015200096206760171234****7890233000JOÃO MACEDO   BAR DO JOÃO       ' }

    it { expect(transaction).to be_valid }
    it { expect(transaction.customer).to be_valid }
    it { expect(transaction.card).to be_valid }
    it { expect(transaction.store).to be_valid }
    it { expect { transaction }.to change(Transaction, :count) }
    it { expect { transaction }.to change(Customer, :count) }
    it { expect { transaction }.to change(Card, :count) }
    it { expect { transaction }.to change(Store, :count) }
    it { expect(transaction.transaction_type).to eq transaction_type }
    it { expect(transaction.amount).to eq 152.0 }
    it { expect(transaction.processed_at).to eq Time.zone.parse('2019-03-01 23:30:00') }

    context 'when a customer already exists' do
      let!(:customer) { create(:customer, cpf: '09620676017') }

      it { expect { transaction }.not_to change(Customer, :count) }
      it { expect(transaction.customer).to eq customer }
    end

    context 'when a card already exists' do
      let!(:card) { create(:card, number: '1234****7890') }

      it { expect { transaction }.not_to change(Card, :count) }
      it { expect(transaction.card).to eq card }
    end

    context 'when a store already exists' do
      let!(:store) { create(:store, name: 'BAR DO JOÃO') }

      it { expect { transaction }.not_to change(Store, :count) }
      it { expect(transaction.store).to eq store }
    end

    context 'when a store already exostos and have a new storekeeper' do
      let!(:store) { create(:store, name: 'BAR DO JOÃO', storekeeper: 'João M') }

      it { expect(transaction.store).to eq store }
      it { expect(transaction.store.storekeeper).to eq 'JOÃO MACEDO' }
    end
  end

  describe '#parse_line' do
    subject(:parse_line) { described_class.new.parse_line(line) }

    let(:line) { '1201903010000015200096206760171234****7890233000JOÃO MACEDO   BAR DO JOÃO       ' }

    it { expect(parse_line.type).to eq 1 }
    it { expect(parse_line.processed_at).to eq Time.zone.parse('2019-03-01 23:30:00') }
    it { expect(parse_line.amount).to eq 152.0 }
    it { expect(parse_line.cpf).to eq '09620676017' }
    it { expect(parse_line.card_number).to eq '1234****7890' }
    it { expect(parse_line.storekeeper).to eq 'JOÃO MACEDO' }
    it { expect(parse_line.store).to eq 'BAR DO JOÃO' }
  end
end
