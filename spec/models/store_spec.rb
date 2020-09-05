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
    it { is_expected.to have_many(:operations).order(occurred_at: :desc) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'helpers' do
    describe 'sorted' do
      it { expect(Store.sorted.to_sql).to eq(Store.order(:name).to_sql) }
    end

    describe 'balance' do
      subject(:store) { create(:store) }

      before do
        create_list(:operation, 3, store: store, value: rand(1..100).to_f)

        # operation from other store (should not consider)
        create(:operation)
      end

      it { expect(store.balance).to eq(store.operations.sum(:signed_value)) }
    end
  end
end
