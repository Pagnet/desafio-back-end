# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoreOperation, type: :model do
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

  it { is_expected.to belong_to :store }

  it { is_expected.to define_enum_for(:kind).with_values(kind_enum) }

  it { is_expected.to validate_presence_of :operated_at }
  it { is_expected.to validate_presence_of :amount }
  it { is_expected.to validate_numericality_of(:amount).only_integer.is_greater_than(0) }
  it { is_expected.to validate_presence_of :card }
  it { is_expected.to validate_presence_of :document }
  it { is_expected.to validate_presence_of :kind }
end
