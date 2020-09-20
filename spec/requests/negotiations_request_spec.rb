require 'rails_helper'

RSpec.describe "Negotiations", type: :request do

  describe "GET /index" do
    let(:shopkeeper){ create(:shopkeeper)}
    it "returns http success" do
      get "/shopkeepers/#{shopkeeper.id}/negotiations"
      expect(response).to have_http_status(:success)
    end
  end

end
