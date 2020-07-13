class HomeController < ApplicationController
  def index
    description = 'upload'
    partial = 'form'

    if params[:imported_file].present?
      CnabImporter.call(ImportedFile.new(attachment_params))
      description = 'done'
      partial = 'result'
    end

    render :index, locals: { description: description, partial: partial }
  end

  private

  def attachment_params
    params.require(:imported_file).permit(:attachment)
  end
end