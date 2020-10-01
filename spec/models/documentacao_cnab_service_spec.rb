require 'rails_helper'

RSpec.describe DocumentacaoCnabService, type: :model do
	it "Deve retornar os atributos serializados das linhas" do
		documento = DocumentacaoCnabService.new("3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       \n")
		allow(TipoDeTransacao).to receive(:get_id_by_tipo).with(3).and_return("4")
		expect(documento.to_h).to eq(
			{
				tipo_de_transacao_id: "4",
				data: "20190301".to_date,
				valor: BigDecimal("0000014200"),
				cpf: "09620676017",
				cartao: "4753****3153",
				hora: "153453",
				dono_da_loja: "JOÃO MACEDO",
				nome_da_loja: "BAR DO JOÃO"
			}
		)
	end
end
