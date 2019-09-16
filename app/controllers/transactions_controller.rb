class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end
end
