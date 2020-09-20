class ShopkeepersController < ApplicationController
  def index
    @shopkeepers = Shopkeeper.all.page(params[:page]).per(20)
  end
end
