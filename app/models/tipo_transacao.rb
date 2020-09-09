class TipoTransacao < ApplicationRecord
	has_many :transacaos
	validates :descricao, presence: true, length: {maximum: 50}
	enum natureza: [:Saida, :Entrada]
	enum sinal: [:Negativo, :Positivo]
end
