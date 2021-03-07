# frozen_string_literal: true

require 'rails_helper'
describe "Root path test", type: :request do
  before do
    get "/"
  end
  it { expect(response).to be_successful }
end
