class TransactionsController < ApplicationController
  def index
    @companies = Company.all.includes(:transactions)
  end

  def create
    file = File.open(params.permit(:file)[:file])
    content = file.readlines.map(&:chomp)
    content.each do |line|
      extracted_params = InputFormatter.new(line).extract_infos
      company = get_company(extracted_params[:company])
      new_transaction = company.transactions.build(extracted_params[:transaction])
      new_transaction.save
      update_total(company, new_transaction)
    end
    redirect_to root_path
  end

  private

  def get_company(params)
    company = Company.find_by(name: params[:name], owner: params[:owner])
    return company if company

    company = Company.new(params)
    company.save
    company
  end

  def update_total(company, transaction)
    new_total = company.total + transaction.value
    company.update(total: new_total)
  end
end
