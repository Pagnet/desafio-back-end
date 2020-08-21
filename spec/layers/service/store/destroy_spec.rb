require 'rails_helper'

RSpec.describe Service::Store::Destroy do
  describe '.execute' do
    let!(:store) do
      create(:store, financial_entries: create_list(:financial_entry, 1))
    end

    it 'destroys a store' do
      expect{ described_class.execute(id: store.id) }
        .to change{ Store.count }.by(-1)
        .and change{ FinancialEntry.count }.by(-1)
    end
  end
end
