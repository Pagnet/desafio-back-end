class TransactionsController < ApplicationController

  def index
    @store_id = params[:store_id]
    params[:q] = {} if params[:q].blank?
    params[:q][:store_id_eq] = @store_id
    @q = Transaction.ransack(params[:q])
    @transactions = @q.result
    @transactions = @transactions.order(:date)
  end

end

