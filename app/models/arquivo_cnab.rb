class ArquivoCnab < ApplicationRecord
	mount_uploader :documento, DocumentoUploader
	validates :documento, presence: true
	
	after_commit :parsear_documento

	private
	def parsear_documento
		SerializeDocumentacaoCnabJob.perform_later(self.id)
	end
end
