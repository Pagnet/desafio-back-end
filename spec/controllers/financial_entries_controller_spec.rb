require 'rails_helper'

RSpec.describe FinancialEntriesController, type: :controller do
  describe 'GET import' do
    it 'renders the index template' do
      get :import_form
      expect(response).to render_template('import')
    end
  end

  describe 'POST import' do
    subject do
      params = {
        upload: {
          file: Rack::Test::UploadedFile.new(File.new(Rails.root.join('spec/fixtures/CNAB-sample.txt')))
        }
      }

      post :import, params: params, as: :json
    end

    it 'imports new financial entries' do
      expect{ subject }.to change{ FinancialEntry.count }.by(1)
        .and change{ Store.count }.by(1)

      expect(response).to render_template('import')
    end

    it 'redirects to stores index'
  end
end
