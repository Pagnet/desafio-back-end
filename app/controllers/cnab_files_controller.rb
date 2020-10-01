class CnabFilesController < ApplicationController
  def new; end

  def create
    cnab_file = files_params[:cnab_file]

    return redirect_to '' if cnab_file.blank? || cnab_file.tempfile.blank?

    FileImporter.call(cnab_file)
    redirect_to stores_path, notice: 'Arquivo importado com sucesso'
  end

  private

  def files_params
    params.require(:cnab_files).permit(:cnab_file)
  end
end
