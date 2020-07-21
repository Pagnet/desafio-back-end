class FileImportedsController < ApplicationController
  before_action :set_file_imported, only: [:destroy]

  # GET /file_importeds
  def index
    @file_importeds = FileImported.all
  end

  # GET /file_importeds/new
  def new
    @file_imported = FileImported.new
  end

  # POST /file_importeds
  def create
    @file_imported = FileImported.new
    @file_imported.file.attach(params[:file_imported][:file])
    respond_to do |format|
      if @file_imported.save
        CnabImporterJob.perform_later(@file_imported.id)

        format.html { redirect_to file_importeds_url, notice: 'Arquivo importado com sucesso!' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /file_importeds/1
  def destroy
    @file_imported.destroy
    respond_to do |format|
      format.html { redirect_to file_importeds_url, notice: 'Arquivo apagado!' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_file_imported
    @file_imported = FileImported.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def file_imported_params
    params.fetch(:file_imported).permit(:file)
  end
end
