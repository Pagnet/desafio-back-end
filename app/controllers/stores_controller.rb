class StoresController < ApplicationController
  before_action :transactions, :stores_for_select, only: :show

  def index
    @stores = Store.all.order(:name).decorate
  end

  def show
    @store = Store.find(params[:id]).decorate
  end

  private

  def transactions
    @transactions = Transaction.where(store_id: params[:id])
  end

  def stores_for_select
    @stores_for_select ||= Store.all
  end
end
