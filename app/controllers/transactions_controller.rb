class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end
  
  def create
    @transaction = Transaction.new
    file_content = File.read(params[:transaction][:file].tempfile.path)
    
    FileParser.new(file_content).perform

    redirect_to transactions_list_path
  end

  def index
    @transactions = Transaction.all
  end
end
