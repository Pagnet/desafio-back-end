require 'rails_helper'

RSpec.describe TransactionKind, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_inclusion_of(:signal).in_array(%w( + - )) }
  end

  describe 'constants' do
    it { expect(TransactionKind::ENTRANCE).to be 1 }
    it { expect(TransactionKind::OUTGOING).to be 2 }
  end

  describe '#to_s' do
    let(:kind) { build(:transaction_kind, description: 'Doação') }
    it { expect(kind.to_s).to eq 'Doação' }
  end

end
