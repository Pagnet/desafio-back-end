class SerializeDocumentacaoCnabJob < ApplicationJob
  queue_as :documento_cnab

  def perform(arquivo_cnab_id)
    documentacao_cnab_service = ArquivoCnabService.new(arquivo_cnab_id)
    documentacao_cnab_service.parsear_arquivo
  end
end
