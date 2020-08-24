require 'rails_helper'

RSpec.describe Service::FinancialEntry::Import do
  describe '.execute' do
    context 'empty processing' do
      subject do
        described_class.execute(file: File.new(Rails.root.join('spec/fixtures/CNAB-blank.txt')))
      end

      it 'imports one financial entry' do
        expect{ subject }.to_not change{ FinancialEntry.count }
      end
    end

    context 'single processing' do
      subject do
        described_class.execute(file: File.new(Rails.root.join('spec/fixtures/CNAB-single.txt')))
      end

      it 'imports one financial entry' do
        expect{ subject }.to change{ FinancialEntry.count }.by(1)
          .and change{ Store.count }.by(1)

        expect(FinancialEntry.last).to have_attributes({
          store: Store.last,
          kind: 'loan',
          transaction_date: Date.parse('2019-03-01'),
          amount: BigDecimal('142.00'),
          social_number: '09620676017',
          card_number: '4753****3153',
          transaction_time: Time.zone.parse('15:34:53'),
        })
      end
    end

    context 'batch processing' do
      subject do
        described_class.execute(file: File.new(Rails.root.join('spec/fixtures/CNAB-complete.txt')))
      end

      it 'imports new financial entries' do
        expect{ subject }.to change{ FinancialEntry.count }.by(21)
          .and change{ Store.count }.by(5)
      end
    end

    context 'failed decimal parse' do
      subject do
        described_class.execute(file: File.new(Rails.root.join('spec/fixtures/CNAB-error-amount.txt')))
      end

      it 'imports new financial entries' do
        expect{ subject }.to raise_error(RuntimeError, "Save failed at line 1: invalid value for BigDecimal(): \"0000014A00\"")
      end
    end

    context 'failed kind id' do
      subject do
        described_class.execute(file: File.new(Rails.root.join('spec/fixtures/CNAB-error-kind.txt')))
      end

      it 'imports new financial entries' do
        expect{ subject }.to raise_error(RuntimeError, "Save failed at line 3: Validation failed: Kind can't be blank")
      end
    end
  end
end
