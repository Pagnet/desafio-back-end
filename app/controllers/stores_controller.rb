class StoresController < ApplicationController
  def index
    @stores = Store.all.order(:name).decorate
  end

  def show
    @store = Store.find(params[:id]).decorate
    @transactions = Transaction.where(store_id: params[:id]).decorate
  end
end
