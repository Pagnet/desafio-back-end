require 'rails_helper'

describe CnabParser do
  subject(:parser) { CnabParser.new(file) }

  let(:file) do
    tempfile = Tempfile.new(['CNAB', '.txt'])
    File.open(tempfile.path, "w") { |f| f.write file_row }
    tempfile.path
  end

  let(:file_row) { '3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       '}

  let(:result) { parser.parse }

  describe 'parse' do
    let(:expected) do
      [
        {
          type: '3',
          date: '20190301',
          value: '0000014200',
          cpf: '09620676017',
          card_number: '4753****3153',
          time: '153453',
          owner: 'JOÃO MACEDO',
          store: 'BAR DO JOÃO'
        }
      ]
    end

    it { expect(result).to eq(expected) }
  end
end
