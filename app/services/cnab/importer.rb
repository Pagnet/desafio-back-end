class CNAB::Importer
  attr_reader :file_path, :cnab_file, :transactions

  def initialize(filename, body)
    @file_path = file_path
    @cnab_file = CnabFile.new(filename: filename, body: body)
  end

  def call
    @transactions ||= ActiveRecord::Base.transaction do
      parsed_transactions.map do |params|
        create_transaction_with_params(params)
      end
    end
  end

  private

  def parsed_transactions
    CNAB::Parser.new(cnab_file.body).call
  end

  def create_transaction_with_params(params)
    store       = Store.find_or_create_by(name: params[:store_name])
    store_owner = StoreOwner.find_or_create_by(name: params[:store_owner_name], store: store)
    type        = TransactionType.find_by_type_num(params[:type_num])
    Transaction.create!(
      occurred_at:         params[:occurrence_datetime],
      cpf:                 params[:cpf],
      value:               params[:value],
      credit_card_number:  params[:credit_card_number],
      store:               store,
      store_owner:         store_owner,
      transaction_type:    type
    )
  end
end
