class StoresController < ApplicationController

  def index

    @q = Store.ransack(params[:q])
    @stores = @q.result
    @stores = @stores.order(:name)

  end

end
