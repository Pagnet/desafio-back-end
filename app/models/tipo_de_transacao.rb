class TipoDeTransacao < ApplicationRecord
	has_many :documentacao_cnabs, foreign_key: :tipo

	class << self
		def get_id_by_tipo(tipo)
			Rails.cache.fetch(["get_id_by_tipo_#{tipo}"]) do
				TipoDeTransacao.where(tipo: tipo).first.id
			end
		end
	end
end
