require 'rails_helper'

RSpec.describe Operation, type: :model do
  subject(:operation) { build(:operation) }

  describe 'factories' do
    it { is_expected.to be_valid }

    it { expect(build(:operation, :invalid)).to be_invalid }
  end

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:occurred_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:value).of_type(:decimal).with_options(precision: 12, scale: 2) }
      it { is_expected.to have_db_column(:cpf).of_type(:string) }
      it { is_expected.to have_db_column(:card_number).of_type(:string) }
      it { is_expected.to have_db_column(:owner).of_type(:string) }
      it { is_expected.to have_db_column(:store_id).of_type(:integer) }
    end
  end

  context 'associations' do
    it { is_expected.to belong_to(:store) }
    it { is_expected.to belong_to(:operation_type) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:operation_type) }
    it { is_expected.to validate_presence_of(:occurred_at) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:card_number) }
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:store) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:title).to(:operation_type).with_arguments(allow_nil: true).with_prefix }
    it { is_expected.to delegate_method(:nature).to(:operation_type).with_arguments(allow_nil: true).with_prefix }
    it { is_expected.to delegate_method(:signal).to(:operation_type).with_arguments(allow_nil: true).with_prefix }
  end
end
