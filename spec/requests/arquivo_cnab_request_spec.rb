require 'rails_helper'

RSpec.describe ArquivoCnabsController, type: :request do

  describe 'action new' do
    before(:each) { get new_arquivo_cnab_path }

    it 'retornar status como sucesso' do
      expect(response).to have_http_status(:success)
    end
  end
end
