require "rails_helper"

RSpec.describe "Transactions route", :type => :routing do
  it "should execute the GET /transactions" do
    expect(get("/transactions")).
      to route_to("transactions#list")
  end
end

RSpec.describe "Transaction file upload request", :type => :request do
  it "should return empty transactions when not exists transactions" do
    @expected = []

    get "/transactions"

    expect(response.body).to eq(@expected.to_json)
  end

  it "should return all transactions group by store" do
    transactionType = TransactionType.find_by(
      numeric_type: 1,
    )

    store = Store.create(owner: "JOÃO MACEDO", name: "BAR DO JOÃO")

    transaction_one = Transaction.create(
      occurrence_date: "20190301",
      amount: 142.0,
      cpf: "11111111111",
      card_number: "4753****3153",
      occurrence_time: "153453",
      store_id: store.id,
      transaction_type_id: transactionType.id,
    )

    transactionType = TransactionType.find_by(
      numeric_type: 3,
    )

    store = Store.create(owner: "MARIA JOSEFINA", name: "LOJA DO Ó - MATRIZ")

    transaction_two = Transaction.create(
      occurrence_date: "20190301",
      amount: 142.0,
      cpf: "70127141073",
      card_number: "4753****3153",
      occurrence_time: "153453",
      store_id: store.id,
      transaction_type_id: transactionType.id,
    )

    transactionType = TransactionType.find_by(
      numeric_type: 2,
    )

    store = Store.create(owner: "JOÃO MACEDO", name: "BAR DO JOÃO")

    transaction_three = Transaction.create(
      occurrence_date: "20190301",
      amount: 150.0,
      cpf: "11111111111",
      card_number: "4553****3153",
      occurrence_time: "193453",
      store_id: store.id,
      transaction_type_id: transactionType.id,
    )

    get "/transactions"

    expect(JSON.parse(response.body).length).to eq(3)
  end
end
