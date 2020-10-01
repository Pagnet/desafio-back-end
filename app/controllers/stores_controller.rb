class StoresController < ApplicationController
  def index
    @stores = Store.all.order(:name)
  end

  def show
    @store = Store.find(params[:id])
    @transactions = Transaction.where(store_id: params[:id])
  end
end
