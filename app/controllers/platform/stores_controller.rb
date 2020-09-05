class Platform::StoresController < ApplicationController

  # helper methods

  helper_method :stores, :store


  # actions

  def index
  end

  def show
  end

  private

  def stores
    @stores ||= Store.all
  end

  def store
    @store ||= Store.find(params[:id])
  end
end
