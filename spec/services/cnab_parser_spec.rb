require 'rails_helper'

RSpec.describe CnabParser do
  describe '.parse' do
    let!(:cnab_data) { file_fixture('CNAB.txt').read }
    subject { described_class.parse(cnab_data) }

    it 'returns parsed cnab data' do
      expect(subject[0][:customer][:name]).to eq('JOÃO MACEDO')
      expect(subject[0][:customer][:cpf]).to eq('09620676017')
      expect(subject[0][:customer][:company_name]).to eq('BAR DO JOÃO')
      expect(subject[0][:transaction][:transaction_type]).to eq('financing')
      expect(subject[0][:transaction][:value]).to eq(142.0)
      expect(subject[0][:transaction][:card_number]).to eq('4753****3153')
      expect(subject[0][:transaction][:ocurrence_datetime]).to eq('2019-03-01 15:34:53.000000000 -0300')

      expect(subject[1][:customer][:name]).to eq('MARIA JOSEFINA')
      expect(subject[1][:customer][:cpf]).to eq('55641815063')
      expect(subject[1][:customer][:company_name]).to eq('LOJA DO Ó - MATRIZ')
      expect(subject[1][:transaction][:transaction_type]).to eq('loan_receipt')
      expect(subject[1][:transaction][:value]).to eq(132.0)
      expect(subject[1][:transaction][:card_number]).to eq('3123****7687')
      expect(subject[1][:transaction][:ocurrence_datetime]).to eq('2019-03-01 14:56:07.000000000 -0300')

      expect(subject[2][:customer][:name]).to eq('MARCOS PEREIRA')
      expect(subject[2][:customer][:cpf]).to eq('84515254073')
      expect(subject[2][:customer][:company_name]).to eq('MERCADO DA AVENIDA')
      expect(subject[2][:transaction][:transaction_type]).to eq('financing')
      expect(subject[2][:transaction][:value]).to eq(122.0)
      expect(subject[2][:transaction][:card_number]).to eq('6777****1313')
      expect(subject[2][:transaction][:ocurrence_datetime]).to eq('2019-03-01 17:27:12.000000000 -0300')
    end
  end
end
