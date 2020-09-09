module TransacoesHelper

	def parsear line
		@detalhes_transacao = {
			tipo: line[0],
			data: line[1..8],
			valor: line[9..18],
			cpf: line[19..29],
			cartao: line[30..41],
			hora: line[42..47],
			nome_representante: line[48..61],
			nome_loja: line[62..80]
		}
	end

	private
	def normalizar
		@detalhes_transacao[:valor] = @detalhes_transacao[:valor].to_f
		@detalhes_transacao[:valor] /= 100
		@detalhes_transacao 
	end
end
