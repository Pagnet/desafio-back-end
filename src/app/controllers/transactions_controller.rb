class TransactionsController < ApplicationController

  # GET /transactions
  def index
    @pagy, @stores = pagy(Store.all, items: 10)
  end

  # POST /transactions/upload
  def upload
    @feedback = ''
    if params[:file]
      begin
        File.open(params[:file].path, 'r').each do |line|
          ImportTransactionJob.perform_now(line)
        end
        @feedback = 'completed'
      rescue => e
        @feedback = 'failed'
      end
    end
    render layout: false
  end

end
