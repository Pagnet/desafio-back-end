# frozen_string_literal: true
require 'rails_helper'

describe Store, type: :model do
  subject(:store) { create(:store) }
  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
  describe 'relationships' do
    it { is_expected.to have_many(:transactions) }
  end
end
