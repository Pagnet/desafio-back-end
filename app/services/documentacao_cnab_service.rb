class DocumentacaoCnabService
	attr_reader :linha

	def initialize(linha)
		@linha = linha
	end

	def to_h
		{
			tipo_de_transacao_id: tipo_de_transacao_id,
			data: data,
			valor: valor,
			cpf: cpf,
			cartao: cartao,
			hora: hora,
			dono_da_loja: dono_da_loja,
			nome_da_loja: nome_da_loja
		}
	end

	private
	def tipo_de_transacao_id
		TipoDeTransacao.get_id_by_tipo(linha[/^\d/].to_i)
	end

	def data
		linha[/^\d(\d{8})/, 1].to_date
	end

	def valor
		BigDecimal(linha[/^\d{9}(\d{10})/, 1])
	end

	def cpf
		linha[/^\d{19}(\d{11})/, 1]
	end

	def cartao
		linha[/^\d{30}(.{12})/, 1]
	end

	def hora
		linha[/^.{42}(.{6})/, 1]
	end

	def dono_da_loja
		linha[/^.{48}(.{14})/, 1].strip
	end

	def nome_da_loja
		linha[/^.{62}(.{1,19})/, 1].strip
	end
end