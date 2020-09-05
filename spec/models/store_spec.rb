require 'rails_helper'

RSpec.describe Store, type: :model do
  subject(:store) { build(:store) }

  describe 'factories' do
    it { is_expected.to be_valid }

    it { expect(build(:store, :invalid)).to be_invalid }
  end

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:operations) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
