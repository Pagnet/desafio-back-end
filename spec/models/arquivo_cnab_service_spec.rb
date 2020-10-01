require 'rails_helper'

RSpec.describe ArquivoCnabService, type: :model do
	context "parsear" do 
		it "Devem ser salvos 2 documentacoes cnab quando o arquivo tiver 2 linhas" do
			create(:tipo_de_transacao, :debito)
			arquivo_cnab = create(:arquivo_cnab)
			arquivo_cnab = ArquivoCnabService.new(arquivo_cnab.id)
			expect do 
				arquivo_cnab.parsear_arquivo
			end.to change {DocumentacaoCnab.count}.by(2)
		end
	end
end
