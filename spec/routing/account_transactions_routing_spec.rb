require "rails_helper"

RSpec.describe AccountTransactionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/account_transactions").to route_to("account_transactions#index")
    end

    it "routes to #show" do
      expect(get: "/account_transactions/1").to route_to("account_transactions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/account_transactions/1/edit").to route_to("account_transactions#edit", id: "1")
    end
  end
end
