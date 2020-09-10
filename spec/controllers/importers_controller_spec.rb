require "rails_helper"

RSpec.describe ImportersController, type: :controller do

  describe "GET importers#index" do
    it "OK" do
      get :index
      expect(response).to be_ok
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("importers/index")
    end
  end

  describe "GET importers#new" do
    it "OK" do
      get :new
      expect(response).to be_ok
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("importers/new")
    end
  end

  describe "POST importers#create" do
    let(:file) { fixture_file_upload('cnab_test.txt') }

    it "create a new importer" do
      post :create, params: { importer: { file: file } }
      expect(response).to be_ok
    end
  end
end
