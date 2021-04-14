class TransactionsController < ApplicationController
  def upload
    begin
      Transactions::Import.execute(transaction_params[:file])
      render json: { message: "File uploaded successfully" }, status: 200
    rescue => exception
      render json: { message: "Import error" }, status: 400
    end
  end

  def list
    transactions = Transactions::List.execute
    render json: transactions
  end

  private

  def transaction_params
    params.require(:transaction).permit(:file)
  end
end
