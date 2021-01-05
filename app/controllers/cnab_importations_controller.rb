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
    @cnab_importation = CnabImportation.new(cnab_importations_params)
    @cnab_importation.status = :starting
    if @cnab_importation.save
      begin
        file_cnab = File.open(params[:cnab_importation][:file], 'r').each_line.map { |l| l }
        ParseFileJob.new.perform(file_cnab, @cnab_importation.id)
      rescue => exception
        @cnab_importation.update_status(:failed)
      end
      redirect_to cnab_importations_url, notice: I18n.t(".controller.cnab_importation.success_message")
    else
      render :new
    end

  end

  private

  def cnab_importations_params
    params.require(:cnab_importation).permit(:status, :file)
  end

  def fetch_status
    @status = CnabImportation.statuses.map{|status| [I18n.t(".activerecord.attributes.cnab_importation.statuses.#{status.first}"), status.last]}
  end
  
end
