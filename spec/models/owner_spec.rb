# frozen_string_literal: true
require 'rails_helper'

describe Owner, type: :model do
  subject(:owner) { create(:owner) }
  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
  describe 'relationships' do
    it { is_expected.to have_many(:stores) }
  end
end
