class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @transactions = Transaction.all
  end

end
