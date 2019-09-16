class TransactionsController < ApplicationController
  def index
    @stores_transactions = Transaction.all.group_by(&:store)
  end
end
