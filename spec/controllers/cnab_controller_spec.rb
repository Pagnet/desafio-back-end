require 'rails_helper'

RSpec.describe CnabController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #upload' do
    let!(:cnab_file) { fixture_file_upload('files/CNAB.txt') }
    subject { post :upload, params: { cnab: { file: cnab_file } } }

    it 'have http success' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'creates customers and transactions' do
      expect { subject }.to change(Customer, :count).from(0).to(3)
                        .and change(Transaction, :count).from(0).to(3)
    end
  end
end
