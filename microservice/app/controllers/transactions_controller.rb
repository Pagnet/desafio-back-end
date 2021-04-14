class TransactionsController < ApplicationController
  def upload
    begin
      UseCases::Transactions::Import.execute(transaction_params[:file])
      render json: { message: "File uploaded successfully" }, status: 200
    rescue => exception
      render json: { message: exception.message }, status: 400
    end
  end

  def list
    transactions = UseCases::Transactions::List.execute
    render json: transactions
  end

  private

  def transaction_params
    params.require(:transaction).permit(:file)
  end
end
