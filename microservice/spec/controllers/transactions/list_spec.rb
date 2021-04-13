require "rails_helper"

RSpec.describe TransactionsController, type: :controller do
  describe "list" do
    it "call use case to list transactions" do
      allow(UseCases::Transactions::List).to receive(:execute)

      get "list"

      expect(UseCases::Transactions::List).to have_received(:execute)
    end
  end
end
