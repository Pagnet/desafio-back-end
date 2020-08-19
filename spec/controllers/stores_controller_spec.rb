require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  describe 'GET index' do
    let!(:stores) { create_list(:store, 2) }

    it 'renders saved stores' do
      get :index

      expect(assigns[:stores]).to have(2).items
      expect(response).to render_template('index')
    end
  end

  describe 'GET edit' do
    let!(:store) { create(:store) }

    it 'renders store edit form' do
      get :edit, params: { id: store.id }

      expect(assigns[:store]).to eq(store)
      expect(response).to render_template('edit')
    end
  end

  describe 'POST update' do
    let!(:store) { create(:store, owner: 'me') }
    subject { post :update, params: { id: store.id, store: { owner: 'you' } } }

    it 'updates a store' do
      expect{ subject }.to change{ Store.find(store.id).owner }.from('me').to('you')
      expect(response).to redirect_to(edit_store_path(store.id))
    end
  end

  describe 'DELETE destroy' do
    let!(:store) { create(:store) }
    subject { delete :destroy, params: { id: store.id } }

    it 'destroy a store' do
      expect{ subject }.to change{ Store.count }.by(-1)
      expect(response).to redirect_to(stores_path)
    end
  end
end
