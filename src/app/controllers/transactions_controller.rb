class TransactionsController < ApplicationController

  # GET /transactions
  def index
    @stores = Store.all
  end

  # POST /transactions/upload
  def upload
  end

end
