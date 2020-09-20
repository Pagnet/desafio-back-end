require 'rails_helper'

RSpec.describe "Shopkeepers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/shopkeepers"
      expect(response).to have_http_status(:success)
    end
  end

end
