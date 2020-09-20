require 'rails_helper'

RSpec.describe "AttachedFiles", type: :request do
  before do
    allow(FileStorage).to receive_message_chain(:client).and_return(FileStorage::MockStorage.new)
  end
  describe 'POST /attached_files' do
    let(:valid_attributes){
      {
        'kind' => 'CnabParser',
        'file' => Rack::Test::UploadedFile.new('spec/file_storage/attached_files/CNAB.txt')
      }
    }

    context 'when request is valid' do
      before { post '/attached_files', params: valid_attributes }

      it 'when attached_file is create' do
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'GET /attached_files' do
    context 'when request is valid' do
      before { get '/attached_files' }

      it 'when attached_file is create' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
