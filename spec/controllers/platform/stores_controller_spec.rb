require 'rails_helper'

RSpec.describe Platform::StoresController, type: :controller do
  let(:user) { create(:user) }

  describe '#index' do
    describe 'unauthorized' do
      before { get(:index) }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    describe 'authorized' do
      before { sign_in(user) && get(:index) }

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

      context 'pagination' do
        let(:per_page) { 3 }

        context 'default page' do
          before do
            create_list(:store, per_page + 1)

            get(:index)
          end

          it { expect(controller.view_context.stores.count).to eq(per_page) }
        end


        context 'with page param' do
          before do
            create_list(:store, per_page + 1)

            get(:index, params: { page: 2 })
          end

          it { expect(controller.view_context.stores.count).to eq(1) }
        end
      end
    end
  end

  describe 'GET #show' do
    let(:store) { create(:store) }

    describe 'unauthorized' do
      before { get(:show, params: { id: store }) }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    describe 'authorized' do
      before { sign_in(user) && get(:show, params: { id: store }) }

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

        context 'last_operations' do
          before { create_list(:operation, 6, store: store) }

          it { expect(view_context.last_operations).to eq(store.operations.order(occurred_at: :desc).limit(5)) }
        end
      end
    end
  end
end
