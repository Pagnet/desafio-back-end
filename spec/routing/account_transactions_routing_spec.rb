require "rails_helper"

RSpec.describe AccountTransactionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/account_transactions").to route_to("account_transactions#index")
    end

    it "routes to #new" do
      expect(get: "/account_transactions/new").to route_to("account_transactions#new")
    end

    it "routes to #show" do
      expect(get: "/account_transactions/1").to route_to("account_transactions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/account_transactions/1/edit").to route_to("account_transactions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/account_transactions").to route_to("account_transactions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/account_transactions/1").to route_to("account_transactions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/account_transactions/1").to route_to("account_transactions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/account_transactions/1").to route_to("account_transactions#destroy", id: "1")
    end
  end
end
