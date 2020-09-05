require 'rails_helper'

RSpec.describe OperationType, type: :model do
  subject(:operation_type) { OperationType.first }

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:code).of_type(:integer) }
      it { is_expected.to have_db_column(:nature).of_type(:integer) }
    end
  end

  describe 'enums' do
    describe 'code' do
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

      it { is_expected.to define_enum_for(:code).with_values(expected) }
    end

    describe 'nature' do
      let(:expected) do
        %i[input output]
      end

      it { is_expected.to define_enum_for(:nature).with_values(expected) }
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:nature) }

    it { is_expected.to validate_uniqueness_of(:code).ignoring_case_sensitivity }
  end

  describe 'helpers' do
    describe 'title' do
      OperationType.codes.keys.each do |code|
        context "when code :#{code}" do
          let(:expected) { I18n.t("activerecord.attributes.operation_type.codes.#{code}") }

          before { operation_type.code = code }

          it { expect(operation_type.title).to eq(expected) }
        end
      end

      context "when code is nil" do
        before { operation_type.code = nil }

        it { expect(operation_type.title).to eq(nil) }
      end
    end
  end
end
