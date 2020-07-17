require 'rails_helper'

RSpec.describe Importers::CnabImporter do
  # it { expect(1).to eql(1) }
  describe '#line_parser' do
    subject(:parsed_line) { described_class.new.line_parser(line) }

    let(:line) { '1201903010000015200096206760171234****7890233000JOÃO MACEDO   BAR DO JOÃO       ' }

    it { expect(parsed_line.type).to eq 1 }
    it { expect(parsed_line.date).to eq Date.new(2019, 3, 1) }
    it { expect(parsed_line.amount).to eq 152.0 }
    it { expect(parsed_line.cpf).to eq '09620676017' }
    it { expect(parsed_line.card_number).to eq '1234****7890' }
    it { expect(parsed_line.hour).to eq '23:30:00' }
    it { expect(parsed_line.storekeeper).to eq 'JOÃO MACEDO' }
    it { expect(parsed_line.store).to eq 'BAR DO JOÃO' }
  end
end
