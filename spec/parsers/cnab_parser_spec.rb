require 'rails_helper'

describe CnabParser do
  subject(:parser) { CnabParser.new(file) }

  let(:file) do
    tempfile = Tempfile.new(['CNAB', '.txt'])
    File.open(tempfile.path, "w") { |f| f.write file_row }
    tempfile.path
  end

  let(:result) { parser.call }

  describe 'call' do
    OperationType.all.each do |operation_type|
      context "when operation_type.code = :#{operation_type.code} and operation_type.nature = :#{operation_type.nature}" do
        let(:operation_type_value) { OperationType.codes[operation_type.code] }
        let(:file_row) { "#{operation_type_value}201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       " }

        let(:expected) do
          [
            {
              operation_type: operation_type,
              occurred_at: Time.parse('2019-03-01 15:34:53 UTC'),
              value: "#{operation_type.signal}142.00".to_f,
              cpf: '09620676017',
              card_number: '4753****3153',
              owner: 'JOÃO MACEDO',
              store: 'BAR DO JOÃO'
            }
          ]
        end

        it { expect(result).to eq(expected) }
      end
    end
  end
end
