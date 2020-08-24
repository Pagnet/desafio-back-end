require 'rails_helper'

RSpec.describe Command::Store::Update do
  describe '#execute' do
    let!(:store) { create(:store) }
    let!(:change) { build_stubbed(:store) }

    subject { described_class.new(id: store.id, changes: change.attributes) }

    it 'updates a store' do
      subject.execute
      expect(Store.last).to have_attributes(change.attributes)
    end
  end
end
