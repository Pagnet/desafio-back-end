require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'validation' do
    it { should validate_numericality_of(:amount) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:store_id) }
    it { should validate_presence_of(:transaction_type_id) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:card_number) }
  end

  context 'associations' do
    it { should  belong_to(:store) }
    it { should  belong_to(:transaction_type) }
  end

  context 'create' do
    let(:transaction) { create(:transaction) }

    it 'must return the default date' do
      expect(transaction.date.strftime("%Y-%m-%d %H:%M:%S")).to eq("2021-01-08 10:10:10")
    end

    it 'must return the default amount' do
      expect(transaction.amount.to_f.to_s).to eq("9.99")
    end

    it 'must return the default card_number' do
      expect(transaction.card_number).to eq("012345678901")
    end

    it 'must return the default cpf' do
      expect(transaction.cpf).to eq("01234567890")
    end

    it 'must return the default transaction_type' do
      expect(transaction.transaction_type).to eq(TransactionType.last)
    end

    it 'must return the default store' do
      expect(transaction.store).to eq(Store.last)
    end
  end

  context 'check amount' do

    let(:store) { create(:store) }
    let(:transaction_type_positive) { create(:transaction_type_positive) }
    let(:transaction_type_negative) { create(:transaction_type_negative ) }
    let!(:transaction_1) { create(:transaction, store: store,  transaction_type: transaction_type_positive, amount: "500") }
    let!(:transaction_2) { create(:transaction, store: store,  transaction_type: transaction_type_negative, amount: "200") }

    it 'must return the difference between the transactions' do
      expect(Transaction.fetch_amount_total(store.id)).to eq(300)
    end

    it 'must return true positive' do
      expect(transaction_1.amount_signal_positive?).to be_truthy
    end

    it 'must return false negative' do
      expect(transaction_2.amount_signal_positive?).to be_falsy
    end
  end

end