require 'rails_helper'

RSpec.describe Service::FinancialEntry::Destroy do
  describe '.execute' do
    let!(:financial_entry) { create(:financial_entry) }
    subject do
      described_class.execute(id: financial_entry.id)
    end

    it 'destroys a financial entry' do
      expect{ subject }.to change{ FinancialEntry.count }.by(-1)
    end
  end
end
