class ShopkeepersController < ApplicationController
  def index
    @shopkeepers = Shopkeeper.all.order(created_at: :desc).page(params[:page]).per(20)
  end
end
