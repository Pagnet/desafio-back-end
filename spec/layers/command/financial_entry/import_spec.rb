require 'rails_helper'

describe Command::FinancialEntry::Import do
  describe '#execute' do
    subject do
      described_class.new(file: File.new(Rails.root.join('spec/fixtures/CNAB-sample.txt')))
    end

    it 'imports new financial entries' do
      expect{ subject.execute }.to change{ FinancialEntry.count }.by(1)
        .and change{ Store.count }.by(1)
    end
  end
end
