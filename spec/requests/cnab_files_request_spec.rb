# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CnabFiles', type: :request do
  describe 'GET #new' do
    it 'returns http success' do
      get new_cnab_file_path
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    xit 'returns http success' do
      get :create
      expect(response).to be_successful
    end
  end
end
