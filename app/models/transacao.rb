class Transacao < ApplicationRecord
	belongs_to :loja
	belongs_to :tipo_transacao
end
