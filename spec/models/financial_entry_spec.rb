require 'rails_helper'

RSpec.describe FinancialEntry, type: :model do
  it "add some examples to (or delete) #{__FILE__}"

  describe 'type conversions' do
    context 'when creating an amount in cents field' do
      subject { described_class.new(amount: '0000014200') }

      it 'parses value to decimal' do
        expect(subject.amount).to eq('142.00'.to_d)
      end
    end

    context 'when creating an unformatted time field' do
      subject { described_class.new(transaction_time: '153209') }

      it 'parses value to time' do
        expect(subject.transaction_time).to eq(Time.zone.parse('15:32:09'))
      end
    end
  end
end
