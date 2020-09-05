require 'rails_helper'

RSpec.describe Importer, type: :model do
  subject(:importer) { build(:importer) }

  describe 'factories' do
    it { is_expected.to be_valid }

    it { expect(build(:importer, :invalid)).to be_invalid }
  end

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:status).of_type(:integer) }
      it { is_expected.to have_db_column(:error_message).of_type(:text) }
    end
  end

  describe 'enums' do
    describe 'status' do
      let(:expected) { %i[pending in_progress success error] }

      it { is_expected.to define_enum_for(:status).with_values(expected) }
    end
  end

  context 'attachments' do
    it { expect(importer.file).to be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe 'validations' do
    describe 'presence' do
      it { is_expected.to validate_presence_of(:status) }
    end

    describe 'attached' do
      before { importer.file.detach }

      it { is_expected.to validate_attached_of(:file) }
    end
  end
end
