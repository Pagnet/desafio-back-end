class ImportersController < ApplicationController

  def index
    @importers = Importer.all
  end

  def new
    @importer = Importer.new
  end

  def create
    begin
      @importer = Importer.new
      raise "Arquivo não pode ficar em branco" if permitted_params[:file].blank?
      @importer.file.attach(permitted_params[:file])

      @importer.save!

      CnabImportService.new(@importer).process

      set_flash_message(:success, "Importador salvo com sucesso!")
      redirect_to importers_path
    rescue Exception => e
      set_flash_message(:alert, e.message)
      render :new
    end
  end

  private

  def permitted_params
    params.require(:importer).permit(:file)
  end

end
