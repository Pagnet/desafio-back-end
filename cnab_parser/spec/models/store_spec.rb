# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'validação' do
    before(:all) do
      @invalid_store = Store.new
      @store = FactoryBot.create(:store)
    end

    it 'com dados obrigatórios não preenchidos' do
      @invalid_store.valid?
      expect(@invalid_store.errors[:name]).not_to be_empty
    end

    it 'com dados válidos' do
      expect(@store.valid?).to eq(true)
    end
  end

  describe 'extração de dados' do
    it 'interpretação dos dados' do
      transaction = '3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA'
      name = Store.extract_name(transaction)

      expect(name).to eq('MERCADO DA AVENIDA')
    end
  end
end
