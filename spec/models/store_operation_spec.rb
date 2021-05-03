require 'rails_helper'

RSpec.describe StoreOperation, type: :model do
  let(:incoming_operations) { StoreOperation::INCOMING_OPERATIONS }
  let(:outgoing_operations) { StoreOperation::OUTGOING_OPERATIONS }

  let(:kind_enum) do
    {
      debt: 1,
  @@ -17,6 +20,13 @@
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
  @@ -27,4 +37,24 @@
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
