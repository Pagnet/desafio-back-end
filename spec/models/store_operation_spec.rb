# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoreOperation, type: :model do
  let(:incoming_operations) { StoreOperation::INCOMING_OPERATIONS }
  let(:outgoing_operations) { StoreOperation::OUTGOING_OPERATIONS }

  let(:kind_enum) do
    {
      debt: 1,
      boleto: 2,
      financing: 3,
      credit: 4,
      loan: 5,
      sales: 6,
      ted: 7,
      doc: 8,
      rent: 9
    }
  end

  let(:store_operations) do
    [
      build(:store_operation, kind: :sales, amount: 40_050),
      build(:store_operation, kind: :rent, amount: 20_000)
    ]
  end

  it { is_expected.to belong_to :store }

  it { is_expected.to define_enum_for(:kind).with_values(kind_enum) }

  it { is_expected.to validate_presence_of :operated_at }
  it { is_expected.to validate_presence_of :amount }
  it { is_expected.to validate_numericality_of(:amount).only_integer.is_greater_than(0) }
  it { is_expected.to validate_presence_of :card }
  it { is_expected.to validate_presence_of :document }
  it { is_expected.to validate_presence_of :kind }

  it { is_expected.to delegate_method(:name).to(:store).with_prefix }

  it { expect(incoming_operations.intersection(outgoing_operations)).to be_empty }

  context 'with an incoming operation' do
    let(:store_operation) { build(:store_operation) }

    it { expect(store_operation.signed_amount).to eq(1_000.0) }
  end

  context 'with an outgoing operation' do
    let(:store_operation) { build(:store_operation, kind: :rent) }

    it { expect(store_operation.signed_amount).to eq(-1_000.0) }
  end

  describe 'class_methods' do
    it { expect(described_class.balance(store_operations)).to eq(200.5) }
  end
end
