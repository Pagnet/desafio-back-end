class Platform::Stores::OperationsController < ApplicationController

  PER_PAGE = 3

  # helper methods

  helper_method :store, :operations


  # actions

  def index
  end

  private

  def operations
    @operations ||= store.operations.page(params[:page]).per(PER_PAGE)
  end

  def store
    @store ||= Store.find(params[:store_id])
  end
end
