require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  context '#create' do
    let(:txt_file) { fixture_file_upload('CNAB.txt', 'text/plain') }
    before(:each) { post :create, params: { file: txt_file } }

    it('registers transactions from file') { expect(Transaction.all.count).to eq(21) }
    it('registers companies') { expect(Company.all.count).to eq(5) }
    it 'calculates total money of a company' do
      company = Company.find_by(name: 'BAR DO JOÃO')
      expect(company.total).to eq(-102)
    end
  end
end
