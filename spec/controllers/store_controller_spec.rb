require "rails_helper"

RSpec.describe StoresController, type: :controller do

  describe "GET stores#index" do
    it "OK" do
      get :index
      expect(response).to be_ok
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("stores/index")
    end
  end

  describe "GET stores#show" do
    let!(:store) { FactoryBot.create(:store) }

    it "OK" do
      get :show, params: { id: store.id }
      expect(response).to be_ok
    end

    it "renders the show template" do
      get :show, params: { id: store.id }
      expect(response).to render_template("stores/show")
    end
  end
end
