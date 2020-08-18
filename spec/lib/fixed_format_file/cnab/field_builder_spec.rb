require 'fixed_format_file/cnab/field_builder'

describe FixedFormatFile::CNAB::FieldBuilder do
  context 'when building a CNAB field' do
    context 'when correct field name and range are given' do
      let(:declared_fields) {[
        [:type, { from: 1, to: 1 }],
        [:transaction_date, { from: 2, to: 9 }],
        [:amount, { from: 10, to: 19 }],
        [:social_number, { from: 20, to: 30 }],
        [:card_number, { from: 31, to: 42 }],
        [:transaction_hour, { from: 43, to: 48 }],
        [:store_owner, { from: 49, to: 62 }],
        [:store_name, { from: 63, to: 81 }],
      ]}

      it 'returns built field configuration' do
        expect(declared_fields.map{ |field| described_class.build(field[0], **field[1])}).to eq([
          { type: [1, 1] },
          { transaction_date: [2, 9] },
          { amount: [10, 19] },
          { social_number: [20, 30] },
          { card_number: [31, 42] },
          { transaction_hour: [43, 48] },
          { store_owner: [49, 62] },
          { store_name: [63, 81] },
        ])
      end
    end

    it 'fails without field name' do
      expect{ described_class.build }.to raise_error(ArgumentError, 'wrong number of arguments (given 0, expected 1; required keywords: from, to)')
    end

    it 'fails without field range from' do
      expect{ described_class.build(:any_name, to: 99) }.to raise_error(ArgumentError, 'missing keyword: :from')
    end

    it 'fails without field range to' do
      expect{ described_class.build(:any_name, from: 1)  }.to raise_error(ArgumentError, 'missing keyword: :to')
    end
  end
end
