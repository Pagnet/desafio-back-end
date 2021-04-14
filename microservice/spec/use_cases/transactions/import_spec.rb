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

    result = Transactions::Import::parse_file(file)

    expect(result).to eq(expectedResult)
  end

  it "import all transactions from file" do
    file = Rack::Test::UploadedFile.new(
      "#{Rails.root}/spec/support/attachments/CNAB.txt",
      "application/txt"
    )

    resultCount = Transactions::Import::execute(file).count

    transactions = Transaction.all.count

    expect(resultCount).to eq(transactions)
  end

  it "sum store transactions amount" do
    file = Rack::Test::UploadedFile.new(
      "#{Rails.root}/spec/support/attachments/CNAB-three-same-stores.txt",
      "application/txt"
    )

    transactionsAmount = {
      amount_transation_1: -142,
      amount_transation_2: -112,
      amount_transation_3: 152,
    }

    transactionsAmountTotal = transactionsAmount[:amount_transation_1] +
                              transactionsAmount[:amount_transation_2] +
                              transactionsAmount[:amount_transation_3]

    resultCount = Transactions::Import::execute(file).count

    store = Store.find_by(
      name: "BAR DO JOÃO",
      owner: "JOÃO MACEDO",
    )

    expect(store.amount_total).to eq(transactionsAmountTotal)
    expect(resultCount).to eq(3)
  end

  it "execute calc_store_amount_total method" do
    allow(Transactions::Import).to receive(:calc_store_amount_total)

    file = Rack::Test::UploadedFile.new(
      "#{Rails.root}/spec/support/attachments/CNAB-three-same-stores.txt",
      "application/txt"
    )

    resultCount = Transactions::Import::execute(file).count

    expect(Transactions::Import).to have_received(:calc_store_amount_total).exactly(3).times
    expect(resultCount).to eq(3)
  end

  it "throw exception when file not exists" do
    expect { Transactions::Import::execute(nil) }.to raise_error("File not found")
  end
end
