class StoreOperationsController < ApplicationController

  def index
    @store_operations = StoreOperation.includes(:store).references(:store).all
  end

  def new
  end

  def create
    if params[:store_operation]&.[](:file)
      ::CnabReader.new(store_operations_params[:file]).execute
      redirect_to store_operations_path
    else
      render :new
    end
  end

  private

  def store_operations_params
    params.require(:store_operation).permit(:file)
  end
end
