class TransacoesService

	def initialize(detalhes)
		@detalhes_transacao = detalhes
	end

	def processa
		ActiveRecord::Base.transaction do
			unless Loja.find_by(nome: @detalhes_transacao[:nome_loja])
				loja = Loja.new(
					nome: @detalhes_transacao[:nome_loja], 
					nome_representante: @detalhes_transacao[:nome_representante]
				)
				loja.save!
			end
			tipo_transacao = TipoTransacao.find(@detalhes_transacao[:tipo])
			data_hora = converte_data
			transacao = Transacao.new(
				data_hora: data_hora,
				valor: @detalhes_transacao[:valor],
				cpf_beneficiario: @detalhes_transacao[:cpf],
				cartao: @detalhes_transacao[:cartao],
				loja: loja,
				tipo_transacao: tipo_transacao) 
			transacao.save!
			return true
		rescue ActiveRecord::RecordInvalid => exception
			return false, exception
		end
	end

	private
	def converte_data
		return DateTime.new(
			@detalhes_transacao[:data][0..3].to_i,
			@detalhes_transacao[:data][4..5].to_i,
			@detalhes_transacao[:data][6..7].to_i,
			@detalhes_transacao[:hora][0..1].to_i,
			@detalhes_transacao[:hora][2..3].to_i,
			@detalhes_transacao[:hora][4..5].to_i
			)
	end
end