class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @companies = Transaction.select(:company).distinct
  end

  def create
    file = File.open(params.permit(:file)[:file])
    content = file.readlines.map(&:chomp)
    content.each do |line|
      transaction_params = InputFormatter.new(line).extract_infos
      new_transaction = Transaction.new(transaction_params)
      new_transaction.save
    end
    redirect_to root_path
  end
end
