require 'rails_helper'

RSpec.describe 'Home', type: :request do

  describe 'GET /index' do
    it 'returns http success' do
      get root_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /file_upload' do
    it 'returns http success' do
      post file_upload_path

      expect(response).to have_http_status(:success)
    end
  end
end
