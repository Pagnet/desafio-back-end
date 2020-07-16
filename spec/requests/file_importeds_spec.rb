require 'rails_helper'

RSpec.describe '/file_importeds', type: :request do
  let(:valid_attributes) do
    { file: Rack::Test::UploadedFile.new('spec/fixtures/files/CNAB.txt') }
  end

  let(:invalid_attributes) do
    { filename: 'xpto' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      FileImported.create! valid_attributes
      get file_importeds_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_file_imported_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new FileImported' do
        expect do
          post file_importeds_url, params: { file_imported: valid_attributes }
        end.to change(FileImported, :count).by(1)
      end

      it 'redirects to the created file_imported' do
        post file_importeds_url, params: { file_imported: valid_attributes }
        expect(response).to redirect_to(file_imported_url(FileImported.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new FileImported' do
        expect do
          post file_importeds_url, params: { file_imported: invalid_attributes }
        end.to change(FileImported, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post file_importeds_url, params: { file_imported: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested file_imported' do
      file_imported = FileImported.create! valid_attributes
      expect do
        delete file_imported_url(file_imported)
      end.to change(FileImported, :count).by(-1)
    end

    it 'redirects to the file_importeds list' do
      file_imported = FileImported.create! valid_attributes
      delete file_imported_url(file_imported)
      expect(response).to redirect_to(file_importeds_url)
    end
  end
end
