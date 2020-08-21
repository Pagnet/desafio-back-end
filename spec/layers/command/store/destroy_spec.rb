require 'rails_helper'

RSpec.describe Command::Store::Destroy do
  describe '#execute' do
    subject { described_class.new(id: store.id) }
    let!(:store) do
      create(:store, financial_entries: create_list(:financial_entry, 1))
    end

    it 'destroys a store' do
      expect{ subject.execute }.to change{ Store.count }.by(-1)
        .and change{ FinancialEntry.count }.by(-1)
    end
  end
end
