require 'fixed_format_file/one_indexed_slicer'

describe FixedFormatFile::OneIndexedSlicer do
  context 'when slicing a fixed format input string' do
    let(:input) { '3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO        ' }
    let(:format) {[
      [1, 1],
      [2, 9],
      [10, 19],
      [20, 30],
      [31, 42],
      [43, 48],
      [49, 62],
      [63, 81],
    ]}

    context 'when correct input and format are given' do
      it 'returns sliced data' do
        expect(described_class.slice(input: input, format: format)).to eq [
          '3',
          '20190301',
          '0000014200',
          '09620676017',
          '4753****3153',
          '153453',
          'JOÃO MACEDO   ',
          'BAR DO JOÃO        ',
        ]
      end
    end

    it 'fails without input' do
      expect{ described_class.slice(format: format) }.to raise_error(ArgumentError, 'missing keyword: :input')
    end

    it 'fails without format' do
      expect{ described_class.slice(input: input) }.to raise_error(ArgumentError, 'missing keyword: :format')
    end
  end
end
