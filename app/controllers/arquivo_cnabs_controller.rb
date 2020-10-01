class ArquivoCnabsController < ApplicationController
	def new
		@arquivo_cnab = ArquivoCnab.new
	end

	def create
		@arquivo_cnab = ArquivoCnab.new(arquivo_cnab_params)
		return render "new" unless @arquivo_cnab.save
		redirect_to new_arquivo_cnab_path
	end

	private
	def arquivo_cnab_params
		params.require(:arquivo_cnab).permit(:documento, :documento_cache)
	end
end
