require 'rails_helper'

RSpec.describe Command::Store::CalculateBalance do
  before do
    Command::FinancialEntry::Import.new(
      file: File.new(Rails.root.join('spec/fixtures/CNAB-balance-positive.txt'))
    ).execute
  end

  describe '#execute' do
    subject { described_class.new(store: Store.last).execute }
    it { is_expected.to eq(BigDecimal('1.99')) }
  end
end
