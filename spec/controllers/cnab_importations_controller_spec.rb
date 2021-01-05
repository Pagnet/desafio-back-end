require 'rails_helper'


RSpec.describe CnabImportationsController, type: :controller do

  let(:valid_attributes) {
    {
      file: "#{Rails.root}/spec/files/CNAB.txt"
    }
  }

  let(:invalid_attributes) {
    {
      file: nil
    }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new cnab importation" do
        expect {
          post :create, params: {cnab_importation: valid_attributes}
        }.to change(CnabImportation, :count).by(1)
      end
    end

    context "with invalid params" do
      it "not returns a success response" do
        expect {
          post :create, params: {cnab_importation: invalid_attributes}
        }.to change(CnabImportation, :count).by(0)
      end
    end

  end

end
