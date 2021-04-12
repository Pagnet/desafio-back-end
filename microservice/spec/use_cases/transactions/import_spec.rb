require "rails_helper"

RSpec.describe "Use case transactions import" do
  before(:each) do
    @transactionType = TransactionType.find_by(
      numeric_type: 3,
    )

    @store = Store.create(
      name: "BAR DO JOÃO",
      owner: "JOÃO MACEDO",
    )
  end

  it "parse file" do
    expectedResult = [{
      transaction_type_id: @transactionType.id,
      occurrence_date: "20190301",
      amount: 142.0,
      cpf: "09620676017",
      card_number: "4753****3153",
      occurrence_time: "153453",
      store_id: @store.id,
    }]

    file = Rack::Test::UploadedFile.new(
      "#{Rails.root}/spec/support/attachments/CNAB-one-line.txt",
      "application/txt"
    )

    result = UseCases::Transactions::Import::parse_file(file)

    expect(result).to eq(expectedResult)
  end

  it "import all transactions from file" do
    file = Rack::Test::UploadedFile.new(
      "#{Rails.root}/spec/support/attachments/CNAB.txt",
      "application/txt"
    )

    resultCount = UseCases::Transactions::Import::execute(file).count

    transactions = Transaction.all.count

    expect(resultCount).to eq(transactions)
  end
end
