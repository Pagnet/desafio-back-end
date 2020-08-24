require 'rails_helper'

RSpec.describe Service::Store::CalculateBalance do
  describe '.execute' do
    subject { described_class.execute(store: Store.last) }

    context 'when the store does not have finanacial entries' do
      before do
        create(:store)
      end

      it { is_expected.to eq(BigDecimal('0')) }
    end

    context 'when the balance is positive' do
      before do
        Service::FinancialEntry::Import.execute(
          file: File.new(Rails.root.join('spec/fixtures/CNAB-balance-positive.txt'))
        )
      end

      it { is_expected.to eq(BigDecimal('1.99')) }
    end

    context 'when the balance is negative' do
      before do
        Service::FinancialEntry::Import.execute(
          file: File.new(Rails.root.join('spec/fixtures/CNAB-balance-negative.txt'))
        )
      end

      it { is_expected.to eq(BigDecimal('-1.99')) }
    end
  end
end
