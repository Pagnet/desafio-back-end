require 'rails_helper'

RSpec.describe InputFormatter, type: :helper do
  context '#extract_infos' do
    let(:line) { InputFormatter.new('3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA') }
    it 'returns hash of formatted inputs' do
      output = line.extract_infos
      expect(output).to eq(
        {
          transaction_type: 3,
          date: '01/03/2019',
          value: -192,
          cpf: '845.152.540-73',
          credit_card: '6777****1313',
          time: '17:27:12',
          owner: 'MARCOS PEREIRA',
          company: 'MERCADO DA AVENIDA'
        }
      )
    end
  end
end
