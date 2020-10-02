class ArquivoCnabService
	attr_reader :arquivo_cnab, :arquivo

	def initialize(arquivo_cnab_id)
		@arquivo_cnab = ArquivoCnab.where(id: arquivo_cnab_id).first
		self.arquivo = File.open(@arquivo_cnab.documento.path).read.encode!("UTF-8", "UTF-8", invalid: :replace)
	end

	def parsear_arquivo
		arquivo.each do |linha|
			parser_documentacao_cnab_service = ParserDocumentacaoCnabService.new(linha)
			documentacao_cnab = DocumentacaoCnab.new(parser_documentacao_cnab_service.to_h)
			documentacao_cnab.arquivo_cnab = arquivo_cnab
			documentacao_cnab.save!
		end
	end

	private

	def arquivo=(arquivo)
    @arquivo = arquivo.each_line.lazy
  end
end