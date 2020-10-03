require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  context '#create' do
    let(:txt_file) { fixture_file_upload('CNAB.txt', 'text/plain') }
    it 'register transactions from file' do
      post :create, params: { file: txt_file }
      expect(Transaction.all.count).to eq(21)
    end
  end
end
