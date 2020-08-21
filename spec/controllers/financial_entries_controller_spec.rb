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
          file: Rack::Test::UploadedFile.new(File.new(Rails.root.join('spec/fixtures/CNAB-single.txt')))
        }
      }

      post :import, params: params
    end

    it 'imports new financial entries' do
      expect{ subject }.to change{ FinancialEntry.count }.by(1)
        .and change{ Store.count }.by(1)

      expect(response).to redirect_to(import_financial_entries_path)
    end
  end

  describe 'DELETE destroy' do
    let!(:entry) { create(:financial_entry) }
    subject { delete :destroy, params: { id: entry.id } }

    it 'destroys a financial entry' do
      expect{ subject }.to change{ FinancialEntry.count }.by(-1)
      expect(response).to redirect_to(edit_store_path(entry.store_id))
    end
  end
end
