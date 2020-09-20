class NegotiationsController < ApplicationController
  before_action :set_shopkeeper

  def index
    @negotiations = FinancialNegotiation.where(shopkeeper: @shopkeeper).page(params[:page]).per(20)
  end

  private

  def set_shopkeeper
    @shopkeeper = Shopkeeper.find_by(id: params[:shopkeeper_id])
  end
end
