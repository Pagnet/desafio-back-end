require 'rails_helper'

RSpec.describe Service::Store::Update do
  describe '.execute' do
    let!(:store) { create(:store) }
    let!(:change) { build_stubbed(:store) }

    it 'updates a store' do
      described_class.execute(id: store.id, changes: change.attributes)
      expect(Store.last).to have_attributes(change.attributes)
    end
  end
end
