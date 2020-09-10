require "rails_helper"

RSpec.describe TransactionsController, type: :controller do

  describe "GET transactions#index" do
    it "OK" do
      get :index
      expect(response).to be_ok
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("transactions/index")
    end
  end
end
