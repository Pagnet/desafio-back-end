class CnabController < ApplicationController
  def index; end

  def upload
    parsed_cnab = CnabParser.parse(cnab_data)

    parsed_cnab.each do |data|
      customer = Customer.where(cpf: data[:customer][:cpf]).first_or_create!(data[:customer])
      customer.transactions.create!(data[:transaction])
    end
  end

  private

    def cnab_data
      params.require(:cnab).permit(:file)[:file].read
    end
end
