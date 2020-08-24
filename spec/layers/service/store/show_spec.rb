require 'rails_helper'

RSpec.describe Service::Store::Show do
  describe '#execute' do
    let!(:store) { create(:store) }

    it 'loads a store' do
      expect(described_class.execute(id: store.id)).to eq(store)
    end
  end
end
