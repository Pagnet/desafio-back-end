class CnabFilesController < ApplicationController
  def new; end

  def create
    @cnab_file = cnab_files_params[:cnab_file]

    if cnab_importer_service.call
      flash[:notice] = 'Arquivo importado com sucesso'
      redirect_to root_path
    else
      flash[:alert] = 'Falha para importar o arquivo'
      render :new
    end
  end

  private

  def cnab_importer_service
    @cnab_importer_service ||= CnabImporter::Processor.new(@cnab_file)
  end

  def cnab_files_params
    params.require(:cnab_files).permit(:cnab_file)
  end
end
