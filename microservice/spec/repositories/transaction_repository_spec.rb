require "rails_helper"

RSpec.describe "Transaction Repository" do
  it "should have all_with_relations method" do
    transactions = Repositories::TransactionRepository::all_with_relations

    expect(transactions).to eq([])
  end

  it "should have the create method" do
    allow(Transaction).to receive(:create)

    Repositories::TransactionRepository::create({})

    expect(Transaction).to have_received(:create).exactly(1).times
  end
end
