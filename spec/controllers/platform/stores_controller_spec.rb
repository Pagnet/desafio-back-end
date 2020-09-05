require 'rails_helper'

RSpec.describe Platform::StoresController, type: :controller do
  describe '#index' do
    before { get(:index) }

    describe 'template' do
      render_views

      context 'responds with success and renders templates' do
        it { expect(response).to be_successful }
        it { expect(response).to render_template(:index) }
      end
    end

    describe 'helper methods' do
      let(:view_context) { controller.view_context }

      context 'stores' do
        let!(:stores) { create_list(:store, 2) }

        it { expect(view_context.stores).to match_array(stores) }
      end
    end
  end

  describe 'GET #show' do
    let(:store) { create(:store) }

    before { get(:show, params: { id: store }) }

    describe 'template' do
      render_views

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:show) }
    end

    describe 'helper methods' do
      let(:view_context) { controller.view_context }

      context 'store' do
        it { expect(view_context.store).to eq(store) }
      end
    end
  end
end
