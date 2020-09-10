class Transacao < ApplicationRecord
	belongs_to :loja
	belongs_to :tipo_transacao

	validates :loja, presence: true
	validates :tipo_transacao, presence: true
end
