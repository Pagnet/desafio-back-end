class DocumentacaoCnab < ApplicationRecord
	belongs_to :tipo_de_transacao
  belongs_to :arquivo_cnab
end
