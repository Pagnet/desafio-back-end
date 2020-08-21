require 'rails_helper'

RSpec.describe Command::Store::Show do
  describe '#execute' do
    let!(:store) { create(:store) }
    subject { described_class.new(id: store.id).execute }

    it 'loads a store' do
      is_expected.to eq(store)
    end
  end
end
