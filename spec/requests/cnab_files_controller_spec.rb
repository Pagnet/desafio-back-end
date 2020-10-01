RSpec.describe CnabFilesController, type: :request do
  before { Rails.application.load_seed }
  
  describe 'GET #new' do
    it 'returns http success' do
      get new_cnab_file_path
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    include Rack::Test::Methods

    let(:file) { fixture_file_upload(valid_cnab_file.path, 'text/plain') }
    subject    { post cnab_files_path {}, cnab_files: { cnab_file: file }, postion: 0 }

    it 'returns http success' do
      expect(subject.status).to be(302)
    end
  end
end
