require 'rails_helper'

RSpec.describe Command::Store::Search do
  describe '#execute' do
    let!(:stores) { create_list(:store, 2) }
    subject { described_class.new.execute }

    it 'returns available stores' do
      is_expected.to match_array(stores)
    end
  end
end
