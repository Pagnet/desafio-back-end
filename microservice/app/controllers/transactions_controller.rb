class TransactionsController < ApplicationController
  def upload
    begin
      UseCases::Transactions::Upload::CNAB.execute(params[:file])

      render json: { message: "File uploaded successfully", status: 200 }
    rescue => exception
      render json: { success: false, message: exception.message, status: 400 }
    end
  end

  private

  def transaction_params
    params.require(:transactions).permit(:file)
  end
end
