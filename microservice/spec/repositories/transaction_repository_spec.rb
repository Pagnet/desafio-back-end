require "rails_helper"

RSpec.describe "Transaction Repository" do
  it "should have the findAll method" do
    allow(Transaction).to receive(:all)

    Repositories::TransactionRepository::findAll

    expect(Transaction).to have_received(:all).exactly(1).times
  end

  it "should have the create method" do
    allow(Transaction).to receive(:create)

    Repositories::TransactionRepository::create({})

    expect(Transaction).to have_received(:create).exactly(1).times
  end
end
