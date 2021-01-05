class CnabImportationsController < ApplicationController

  before_action :fetch_status, only: :index
  def index

    @q = CnabImportation.ransack(params[:q])
    @imports = @q.result
    @imports = @imports.order(:id)

  end

  def new
    @cnab_importations = CnabImportation.new
  end

  def create
    @cnab_importation = CnabImportation.new() 
    @cnab_importation.status = :starting
    @cnab_importation.file = fetch_data_file
    if @cnab_importation.save
      begin
        ParseFileJob.new.perform(@cnab_importation.id)
      rescue => exception
        @cnab_importation.update_status(:failed)
      end
      redirect_to cnab_importations_url, notice: I18n.t(".controller.cnab_importation.success_message")
    else
      render :new
    end

  end

  private

  def fetch_data_file
    File.open(params[:cnab_importation][:file], 'r').each_line.map { |l| l }
  end

  def fetch_status
    @status = CnabImportation.statuses.map{|status| [I18n.t(".activerecord.attributes.cnab_importation.statuses.#{status.first}"), status.last]}
  end
  
end
