RSpec.describe StoresController, type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get stores_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let!(:store) { FactoryBot.create(:store) }

    it 'returns http success' do
      get stores_path(store)
      expect(response).to have_http_status(:success)
    end
  end
end
