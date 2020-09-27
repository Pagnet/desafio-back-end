# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stores', type: :request do
  describe 'GET /index' do
    before do
      create_list(:store, 2)
      get stores_url
    end

    it { expect(response).to be_successful }
  end
end
