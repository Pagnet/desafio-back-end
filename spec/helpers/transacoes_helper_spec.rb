require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TransacoesHelper. For example:
#
# describe TransacoesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TransacoesHelper, type: :helper do
  context 'Parseando e Normalizando linhas do arquivo' do
    it "def parsear" do
      linha = "3201903010000014200096206760174753****3153153453JO\xC3\x83O MACEDO   BAR DO JO\xC3\x83O       \n"
      parsear(linha)
      
      expect(@detalhes_transacao[:tipo]).to eq("3")
      expect(@detalhes_transacao[:data]).to eq("20190301")
      expect(@detalhes_transacao[:valor]).to eq("0000014200")
      expect(@detalhes_transacao[:cpf]).to eq("09620676017")
      expect(@detalhes_transacao[:cartao]).to eq("4753****3153")
      expect(@detalhes_transacao[:hora]).to eq("153453")
      expect(@detalhes_transacao[:nome_representante]).to eq("JO\xC3\x83O MACEDO   ")
      expect(@detalhes_transacao[:nome_loja]).to eq("BAR DO JO\xC3\x83O       \n")
    end

    it "def normalizar" do
    	@detalhes_transacao = { valor: "0000014200" }
      normalizar

      expect(@detalhes_transacao[:valor]).to eq(142.00)
    end
  end
end
