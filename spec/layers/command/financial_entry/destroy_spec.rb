require 'rails_helper'

RSpec.describe Command::FinancialEntry::Destroy do
  describe '#execute' do
    subject { described_class.new(id: financial_entry.id) }
    let!(:financial_entry) { create(:financial_entry) }

    it 'destroys a financial entry' do
      expect{ subject.execute }.to change{ FinancialEntry.count }.by(-1)
    end
  end
end
