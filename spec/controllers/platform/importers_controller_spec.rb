require 'rails_helper'

RSpec.describe Platform::ImportersController, type: :controller do
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

      context 'importers' do
        let!(:importers) { create_list(:importer, 2) }

        it { expect(view_context.importers).to match_array(importers) }
      end
    end
  end

  describe 'GET #new' do
    before { get(:new) }

    describe 'template' do
      render_views

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:new) }
    end

    describe 'helper methods' do
      let(:view_context) { controller.view_context }

      context 'importer' do
        it { expect(view_context.importer).to be_new_record }
      end
    end
  end

  describe 'POST #create' do
    let(:permitted_params) do
      [:file]
    end

    let(:valid_params) do
      { importer: attributes_for(:importer) }
    end

    describe 'helper methods' do
      let(:view_context) { controller.view_context }

      before { post(:create, params: valid_params) }

      context 'importer' do
        it { expect(view_context.importer).to be_persisted }
      end
    end

    describe 'permitted_params' do
      it { is_expected.to permit(*permitted_params).for(:create, params: valid_params).on(:importer) }
    end

    describe 'valid' do
      it 'saves' do
        expect do
          post(:create, params: valid_params)
        end.to change(Importer, :count).by(1)
      end

      context 'redirect to index' do
        let(:expected_flash) { I18n.t('platform.importers.create.done') }

        before { post(:create, params: valid_params) }

        it { expect(response).to redirect_to(platform_importers_path) }
        it { expect(controller).to set_flash.now.to(expected_flash) }
      end

      context 'call service' do
        let(:service) { double }
        let(:importer) { Importer.last }

        before do
          allow(ImporterService).to receive(:new) { service }
          allow(service).to receive(:call)

          post(:create, params: valid_params)
        end

        it { expect(ImporterService).to have_received(:new).with(importer.id) }
        it { expect(service).to have_received(:call) }
      end
    end

    context 'invalid' do
      before { allow_any_instance_of(Importer).to receive(:valid?).and_return(false) }

      it 'does not save' do
        expect do
          post(:create, params: valid_params)
        end.to change(Importer, :count).by(0)
      end

      context 'render new with errors' do
        let(:expected_flash) { I18n.t('platform.importers.create.error') }

        before { post(:create, params: valid_params) }

        it { expect(response).to render_template(:new) }
        it { expect(controller).to set_flash.now.to(expected_flash) }
      end

      context 'not call service' do
        before do
          allow(ImporterService).to receive(:new)

          post(:create, params: valid_params)
        end

        it { expect(ImporterService).not_to have_received(:new) }
      end
    end
  end
end
