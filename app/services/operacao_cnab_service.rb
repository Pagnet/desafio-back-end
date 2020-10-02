class OperacaoCnabService
	class << self
	  def operacoes_por_lojas
	  	ActiveRecord::Base.connection.execute("
				Select nome_da_loja, SUM(total_debito) AS total_debito, SUM(total_credito) AS total_credito, (SUM(total_debito) - SUM(total_credito)) AS saldo_em_conta FROM
				(
					(
						SELECT nome_da_loja, SUM(valor) AS total_debito, 0 AS total_credito FROM documentacao_cnabs INNER JOIN tipo_de_transacaos ON  tipo_de_transacaos.id = documentacao_cnabs.tipo_de_transacao_id WHERE tipo_de_transacaos.sinal = '+' GROUP BY nome_da_loja
					) UNION ALL
					(
						SELECT nome_da_loja, 0 AS total_debito, SUM(valor) AS total_credito FROM documentacao_cnabs INNER JOIN tipo_de_transacaos ON  tipo_de_transacaos.id = documentacao_cnabs.tipo_de_transacao_id WHERE tipo_de_transacaos.sinal = '-' GROUP BY nome_da_loja
					) 
				) resultado
				GROUP BY nome_da_loja ORDER BY nome_da_loja ASC, saldo_em_conta ASC")
	  end
	end
end