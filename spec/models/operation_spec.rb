require 'rails_helper'

RSpec.describe Operation, type: :model do
  subject(:operation) { build(:operation) }

  describe 'factories' do
    it { is_expected.to be_valid }

    it { expect(build(:operation, :invalid)).to be_invalid }
  end

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:operation_type).of_type(:integer) }
      it { is_expected.to have_db_column(:occurred_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:value).of_type(:decimal).with_options(precision: 12, scale: 2) }
      it { is_expected.to have_db_column(:cpf).of_type(:string) }
      it { is_expected.to have_db_column(:card_number).of_type(:string) }
      it { is_expected.to have_db_column(:owner).of_type(:string) }
      it { is_expected.to have_db_column(:store_id).of_type(:integer) }
    end
  end

  describe 'enums' do
    describe 'operation_type' do
      let(:expected) do
        {
          debit: 1,
          bank_slip: 2,
          financing: 3,
          credit: 4,
          loan: 5,
          sales: 6,
          ted: 7,
          doc: 8,
          rent: 9
        }
      end

      it { is_expected.to define_enum_for(:operation_type).with_values(expected) }
    end
  end

  context 'associations' do
    it { is_expected.to belong_to(:store) }
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

  xdescribe 'helpers' do
    describe 'operation_signal' do
      subject(:operation) { build(:operation, operation_type: operation_type) }

      context 'input' do
        %i[
          debit
          credit
          loan
          sales
          ted
          doc
        ].each do |operation_type|
          context "when operation_type :#{operation_type}" do
            it{ expect(operation.operation_signal).to eq('+')}
          end
        end
      end

      context 'output' do
        %i[
          bank_slip
          financing
          rent
        ].each do |operation_type|
          context "when operation_type :#{operation_type}" do
            it{ expect(operation.operation_signal).to eq('-')}
          end
        end
      end
    end
  end
end
