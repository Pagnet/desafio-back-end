class StoresController < ApplicationController
  before_action :set_store, only: [:transactions]
  
  def create
    file_content = File.read(params[:transaction][:file].tempfile.path)
    
    FileParser.new(file_content).perform
  end

  def index
    @stores = Store.all
  end

  def transactions
    @transactions = @store.transactions
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end
