# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validação' do
    before(:all) do
      @invalid_user = User.new
      @user = FactoryBot.create(:user)
    end

    it 'com dados obrigatórios não preenchidos' do
      @invalid_user.valid?
      expect(@invalid_user.errors[:name]).not_to be_empty
    end

    it 'com dados válidos' do
      expect(@user.valid?).to eq(true)
    end
  end

  describe 'extração de dados' do
    it 'interpretação dos dados' do
      transaction = '3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA'
      name = User.extract_name(transaction)

      expect(name).to eq('MARCOS PEREIRA')
    end
  end
end
