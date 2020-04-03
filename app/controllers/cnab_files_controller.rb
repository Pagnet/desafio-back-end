class CnabFilesController < ApplicationController
  def new; end

  def create
    @cnab_file = cnab_files_params[:cnab_file]

    CnabImporter::Processor.new(@cnab_file).call
  end

  private

  def cnab_files_params
    params.require(:cnab_files).permit(:cnab_file)
  end
end
