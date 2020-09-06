class Platform::ImportersController < PlatformController

  PER_PAGE = 3

  # helper methods

  helper_method :importers, :importer


  # actions

  def index
  end

  def new
  end

  def create
    if importer.save
      flash.now[:notice] = t('.done')
      call_service
      redirect_to platform_importers_path
    else
      flash.now[:alert] = t('.error')
      render :new
    end
  end

  private

  def importers
    @importers ||= Importer.all.page(params[:page]).per(PER_PAGE)
  end

  def importer
    @importer ||= importers.pending.new(resource_params)
  end

  def resource_params
    params.require(:importer).permit(:file) if params[:importer]
  end

  def call_service
    ImporterService.new(importer.id).delay.call
  end
end
