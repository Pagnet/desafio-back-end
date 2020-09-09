class Loja < ApplicationRecord
	has_many :transacoaos
	validates :nome, presence: true, length: {maximum: 19}
	validates :nome_representante, presence: true, length: {maximum: 14} 
end
