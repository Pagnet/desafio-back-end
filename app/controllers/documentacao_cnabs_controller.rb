class DocumentacaoCnabsController < ApplicationController
	def index
		@operacao_cnabs_service = OperacaoCnabService.operacoes_por_lojas
	end
end
