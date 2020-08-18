require 'fixed_format_file/cnab/line_reader'
require 'fixed_format_file/base/slicer'

describe FixedFormatFile::CNAB::LineReader do
  context 'when reading a CNAB line' do
    subject { described_class.new(fields: fields, **config) }

    let(:config) { {} }
    let(:input) { '3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO        ' }
    let(:fields) {{
      type: [1, 1],
      transaction_date: [2, 9],
      amount: [10, 19],
      social_number: [20, 30],
      card_number: [31, 42],
      transaction_hour: [43, 48],
      store_owner: [49, 62],
      store_name: [63, 81],
    }}

    context 'when correct input and fields are given' do
      it 'returns read data as key/value pairs' do
        expect(subject.read(input: input)).to eq({
          type: '3',
          transaction_date: '20190301',
          amount: '0000014200',
          social_number: '09620676017',
          card_number: '4753****3153',
          transaction_hour: '153453',
          store_owner: 'JOÃO MACEDO   ',
          store_name: 'BAR DO JOÃO        ',
        })
      end
    end

    context 'when no fields are given' do
      let(:fields) { nil }

      it 'returns empty data' do
        expect(subject.read(input: input)).to be_nil
      end
    end

    context 'when a custom slicer is given' do
      class CustomSlicer < FixedFormatFile::Base::Slicer
        def self.slice(input:, format:)
          ['any']
        end
      end

      let(:config) {{ slicer: CustomSlicer }}

      it 'uses custom slicing' do
        expect(subject.read(input: input)).to eq({
          type: 'any',
          transaction_date: nil,
          amount: nil,
          social_number: nil,
          card_number: nil,
          transaction_hour: nil,
          store_owner: nil,
          store_name: nil,
        })
      end
    end

    it 'fails without input' do
      expect{ subject.read }.to raise_error(ArgumentError, 'missing keyword: :input')
    end
  end
end
