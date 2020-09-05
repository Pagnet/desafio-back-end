class Platform::StoresController < ApplicationController

  PER_PAGE = 3

  # helper methods

  helper_method :stores, :store, :last_operations


  # actions

  def index
  end

  def show
  end

  private

  def stores
    @stores ||= Store.sorted.page(params[:page]).per(PER_PAGE)
  end

  def store
    @store ||= Store.find(params[:id])
  end

  def last_operations
    @last_operations ||= store.operations.limit(5)
  end
end
