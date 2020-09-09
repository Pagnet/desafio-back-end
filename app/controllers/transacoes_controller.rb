class TransacoesController < ApplicationController
	include TransacoesHelper
	before_action :authorize

	def index
		@ultimas_transacoes = Transacao.limit(5) 
	end

	def importar
		erros = []
		params[:arquivo].read.each_line do |transacao|
			parsear(transacao)
			normalizar
			resultado, mensagem = TransacoesService.new(@detalhes_transacao).processa
			unless resultado
				erros << mensagem
			end
		end
		flash[:error] = erros unless erros.blank?
		redirect_to transacoes_path
	end

	def mostrar_transacoes
		
	end
end
