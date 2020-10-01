class CnabFilesController < ApplicationController
  def new; end

  def create
    @cnab_file = params[:cnab_files][:cnab_file] if params[:cnab_files].present?

    return redirect_to new_cnab_file_path, alert: 'Atenção: Erro ao importar arquivo!' if invalid_file

    FileImporter.call(@cnab_file)
    redirect_to stores_path, notice: 'Arquivo importado com sucesso'
  end

  private

  def invalid_file
    @cnab_file.blank? || invalid_file_extension?
  end

  def invalid_file_extension?
    accepted_formats = ['.txt']
    accepted_formats.exclude? File.extname(@cnab_file.original_filename)
  end
end
