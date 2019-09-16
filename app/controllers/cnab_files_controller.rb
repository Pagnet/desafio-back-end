class CnabFilesController < ApplicationController
  def import
    CNAB::Importer.new(params[:file].original_filename, params[:file].read).call
    redirect_to transactions_path
  end
end
