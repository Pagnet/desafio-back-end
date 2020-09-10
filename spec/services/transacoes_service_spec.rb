require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TransacoesService. For example:
#
# describe TransacoesService do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TransacoesService, type: :service do

  before(:each) do
    TipoTransacao.create!(descricao: 'Débito', natureza: 1, sinal: 1)
    TipoTransacao.create!(descricao: 'Boleto', natureza: 0, sinal: 0)
    TipoTransacao.create!(descricao: 'Financiamento', natureza: 0, sinal: 0)
    TipoTransacao.create!(descricao: 'Crédito', natureza: 1, sinal: 1)
    TipoTransacao.create!(descricao: 'Recebimento Empréstimo', natureza: 1, sinal: 1)
    TipoTransacao.create!(descricao: 'Vendas', natureza: 1, sinal: 1)
    TipoTransacao.create!(descricao: 'Recebimento TED', natureza: 1, sinal: 1)
    TipoTransacao.create!(descricao: 'Recebimento DOC', natureza: 1, sinal: 1)
    TipoTransacao.create!(descricao: 'ALuguel', natureza: 0, sinal: 0)
  end

  context 'Processar arquivo' do
    it "def processa com dados corretos" do
      detalhes_transacao = {
        tipo: "3",
        data: "20190301",
        valor: "0000014200",
        cpf: "09620676017",
        cartao: "4753****3153",
        hora: "153453",
        nome_representante: "JO\xC3\x83O MACEDO   ",
        nome_loja: "BAR DO JO\xC3\x83O       \n"
      }
      result, msg = TransacoesService.new(detalhes_transacao).processa
      
      expect(result).to eq(true)
    end

    it "def processa com tipo_transacao inválido" do
      detalhes_transacao = {
        tipo: "10",
        data: "20190301",
        valor: "0000014200",
        cpf: "09620676017",
        cartao: "4753****3153",
        hora: "153453",
        nome_representante: "JO\xC3\x83O MACEDO   ",
        nome_loja: "BAR DO JO\xC3\x83O       \n"
      }
      result, msg = TransacoesService.new(detalhes_transacao).processa
      
      expect(result).to eq(false)
    end

    it "def converte data" do
      detalhes_transacao = { data: "20190301", hora: "153453" }
    	result = TransacoesService.new(detalhes_transacao).send(:converte_data)

      expect(result).to eq(DateTime.new(2019, 3, 1, 15, 34, 53))
    end
  end
end