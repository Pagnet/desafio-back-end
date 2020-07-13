class HomeController < ApplicationController
  def index
    description = 'upload'
    partial = 'form'

    if params[:imported_file].present?
      @imported_file = ImportedFile.new(attachment_params)
      CnabImporter.call(@imported_file)
      description = 'result'
      partial = 'done'
    end

    render :index, locals: { description: description, partial: partial }
  end

  private

  def attachment_params
    params.require(:imported_file).permit(:attachment)
  end
end