class ImportacaosController < ApplicationController
  before_action :set_importacao, only: [:show, :edit, :update, :destroy]

  # GET /importacaos
  # GET /importacaos.json
  def index
    @importacaos = Importacao.all
  end

  # GET /importacaos/1
  # GET /importacaos/1.json
  def show
  end

  # GET /importacaos/new
  def new
    @importacao = Importacao.new
  end

  # GET /importacaos/1/edit
  def edit
  end

  # POST /importacaos
  # POST /importacaos.json
  def create
    @importacao = Importacao.new(importacao_params)

    respond_to do |format|
      if @importacao.save
        format.html { redirect_to @importacao, notice: 'Importacao was successfully created.' }
        format.json { render :show, status: :created, location: @importacao }
      else
        format.html { render :new }
        format.json { render json: @importacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /importacaos/1
  # PATCH/PUT /importacaos/1.json
  def update
    respond_to do |format|
      if @importacao.update(importacao_params)
        format.html { redirect_to @importacao, notice: 'Importacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @importacao }
      else
        format.html { render :edit }
        format.json { render json: @importacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /importacaos/1
  # DELETE /importacaos/1.json
  def destroy
    @importacao.destroy
    respond_to do |format|
      format.html { redirect_to importacaos_url, notice: 'Importacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_importacao
      @importacao = Importacao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def importacao_params
      params.require(:importacao).permit(:arquivo)
    end
end
