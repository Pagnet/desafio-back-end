class HomeController < ApplicationController
  def index; end

  def file_upload
    service = CnabImporter.call(ImportedFile.new(attachment_params))

    if service[:errors].empty?
      debugger
      @transactions = service[:imported_file].transactions
    else
      render :index
    end

    render :results
  end

  private

  def attachment_params
    params.require(:imported_file).permit(:attachment)
  end
end