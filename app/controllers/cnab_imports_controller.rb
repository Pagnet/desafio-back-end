class CnabImportsController < ApplicationController
  before_action :set_cnab_import, only: [:show]

  # GET /cnab_imports
  # GET /cnab_imports.json
  def index
    @cnab_imports = CnabImport.paginate(page: params[:page], per_page: 30)
  end

  # GET /cnab_imports/1
  # GET /cnab_imports/1.json
  def show
  end

  # GET /cnab_imports/new
  def new
    @cnab_import = CnabImport.new
  end

  # GET /cnab_imports/1/edit
  def edit
  end

  # POST /cnab_imports
  # POST /cnab_imports.json
  def create
    @cnab_import = CnabImport.new(cnab_import_params)

    respond_to do |format|
      if @cnab_import.save
        format.html { redirect_to account_transactions_url, notice: "Cnab import was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cnab_import
      @cnab_import = CnabImport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cnab_import_params
      params.require(:cnab_import).permit(:name, :file)
    end
end
