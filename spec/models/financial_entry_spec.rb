require 'rails_helper'

RSpec.describe FinancialEntry, type: :model do
  subject {
    described_class.new(
      store: create(:store),
      kind: 'loan',
      transaction_date: Date.parse('2019-03-01'),
      amount: BigDecimal('142.00'),
      social_number: '09620676017',
      card_number: '4753****3153',
      transaction_time: Time.zone.parse('15:34:53')
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a store" do
    subject.store = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a kind" do
    subject.kind = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a transaction_date" do
    subject.transaction_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a transaction_time" do
    subject.transaction_time = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an amount" do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a social_number" do
    subject.social_number = nil
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    subject { described_class.new }

    it { is_expected.to belong_to(:store) }
  end

  describe 'constraints' do
    subject { described_class.new }

    it { is_expected.to validate_presence_of(:store) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:transaction_date) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:social_number) }
    it { is_expected.to validate_presence_of(:transaction_time) }
  end

  describe 'type conversions' do
    context 'when creating an amount in cents field' do
      subject { described_class.new(amount: '0000014200') }

      it 'parses value to decimal' do
        expect(subject.amount).to eq('142.00'.to_d)
      end
    end

    context 'when creating an unformatted time field' do
      subject { described_class.new(transaction_time: '153209') }

      it 'parses value to time' do
        expect(subject.transaction_time).to eq(Time.zone.parse('15:32:09'))
      end
    end
  end
end
