require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:owner) }
  end

  context 'associations' do
    it { should  have_many(:transactions) }
  end

  context 'create' do
    let(:store) { create(:store) }

    it 'must return the default name' do
      expect(store.name).to eq("MyName")
    end

    it 'must return the default owner' do
      expect(store.owner).to eq("MyOwner")
    end
  end
end


