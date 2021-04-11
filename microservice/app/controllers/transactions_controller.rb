class TransactionsController < ApplicationController
  def upload
    puts transaction_params
    UseCase::Transaction::Upload.new(repo).call(transaction_params)
    render json: { message: "File uploaded successfully" }
  end

  private

  def transaction_params
    params.require(:transaction).permit(:file)
  end

  def repo
    @repo ||= TransactionRepository.new
  end
end
