# frozen_string_literal: true
require 'rails_helper'

describe Transaction, type: :model do
  subject(:transaction) { create(:transaction) }
  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:document_number) }
    it { is_expected.to validate_presence_of(:paid_at) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_numericality_of(:amount_in_cents)}

    it {
      is_expected.to define_enum_for(:kind).with_values(
        debit: 1,
        bill: 2,
        financing: 3,
        credit: 4,
        loan: 5,
        sales: 6,
        ted: 7,
        doc: 8,
        rent: 9
      ).backed_by_column_of_type(:integer)
    }
  end
  describe 'relationships' do
    it { is_expected.to belong_to(:store) }
  end
end
