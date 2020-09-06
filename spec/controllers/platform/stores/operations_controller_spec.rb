require 'rails_helper'

RSpec.describe Platform::Stores::OperationsController, type: :controller do
  let(:user) { create(:user) }
  let(:store) { create(:store) }

  describe '#index' do
    describe 'unauthorized' do
      before { get(:index, params: { store_id: store }) }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    describe 'authorized' do
      before { sign_in(user) && get(:index, params: { store_id: store }) }

      describe 'template' do
        render_views

        context 'responds with success and renders templates' do
          it { expect(response).to be_successful }
          it { expect(response).to render_template(:index) }
        end
      end

      describe 'helper methods' do
        let(:view_context) { controller.view_context }

        context 'store' do
          it { expect(view_context.store).to eq(store) }
        end

        context 'operations' do
          let!(:operations) { create_list(:operation, 2, store: store) }

          it { expect(view_context.operations).to match_array(operations) }
        end
      end

      context 'pagination' do
        let(:per_page) { 3 }

        context 'default page' do
          before do
            create_list(:operation, per_page + 1, store: store)

            get(:index, params: { store_id: store })
          end

          it { expect(controller.view_context.operations.count).to eq(per_page) }
        end


        context 'with page param' do
          before do
            create_list(:operation, per_page + 1, store: store)

            get(:index, params: { store_id: store, page: 2 })
          end

          it { expect(controller.view_context.operations.count).to eq(1) }
        end
      end
    end
  end
end
