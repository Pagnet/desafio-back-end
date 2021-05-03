# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StoreOperations', type: :request do
  describe 'GET /index' do
    before do
      create_list(:store_operation, 2)
      get store_operations_url
    end

    it { expect(response).to be_successful }
  end

  describe 'GET /new' do
    before { get new_store_operation_url }

    it { expect(response).to be_successful }
  end

  describe 'POST /create' do
    subject(:action) { post store_operations_url, params: { store_operation: attributes } }

    context 'with valid parameters' do
      let(:attributes) { { file: file_path } }
      let(:file_path) { 'spec/fixtures/cnab_sample.txt' }

      it { expect { action }.to change(StoreOperation, :count).by(3).and(change(Store, :count).by(2)) }

      it 'redirects to the created store_operation' do
        action
        expect(response).to redirect_to store_operations_url
      end
    end

    context 'with invalid parameters' do
      let(:attributes) { {} }

      it { expect { action }.to change(StoreOperation, :count).by(0) }

      it 'renders the new template' do
        action
        expect(response).to be_successful
      end
    end
  end
end
