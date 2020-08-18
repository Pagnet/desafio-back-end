require 'fixed_format_file/base/dsl'
require 'fixed_format_file/cnab/line_reader'
require 'fixed_format_file/cnab/field_builder'

describe FixedFormatFile::Base::DSL do
  context 'when parsing a CNAB line' do
    context 'when correct field declarations are given' do
      class SampleDSL
        include FixedFormatFile::Base::DSL

        read_line_with ::FixedFormatFile::CNAB::LineReader
        build_field_with ::FixedFormatFile::CNAB::FieldBuilder

        field :type, from: 1, to: 1
        field :transaction_date, from: 2, to: 9
        field :amount, from: 10, to: 19
        field :social_number, from: 20, to: 30
        field :card_number, from: 31, to: 42
        field :transaction_hour, from: 43, to: 48
        field :store_owner, from: 49, to: 62
        field :store_name, from: 63, to: 81
      end

      subject { SampleDSL.new }
      let(:input) { '3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO        ' }

      it 'returns read data as key/value pairs' do
        expect(subject.parse(input)).to eq({
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
  end
end
