class AccountTransactionsController < ApplicationController
  before_action :set_account_transaction, only: [:show]

  # GET /account_transactions
  # GET /account_transactions.json
  def index
    @account_transactions = AccountTransaction.paginate(page: params[:page], per_page: 10)
  end

  # GET /account_transactions/1
  # GET /account_transactions/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_transaction
      @account_transaction = AccountTransaction.find(params[:id])
    end
end
