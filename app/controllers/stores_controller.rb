class StoresController < ApplicationController
  # GET /stores
  # GET /stores.json
  def index
    @stores = Command::Store::Search.new.execute
  end

  # GET /stores/1/edit
  def edit
    @store = Command::Store::Show.new(id: params[:id]).execute
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      @store = Command::Store::Update.new(id: params[:id], changes: store_params).execute

      if @store.update(store_params)
        format.html { redirect_to edit_store_path(@store.id), notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @deleted_store = Command::Store::Destroy.new(id: params[:id]).execute

    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(:name, :owner)
    end
end
