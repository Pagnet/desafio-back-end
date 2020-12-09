# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cnab, type: :model do
  describe 'validação' do
    before(:all) do
      @invalid_cnab = Cnab.new
      @cnab = FactoryBot.create(:cnab)
    end

    it 'com dados obrigatórios não preenchidos' do
      @invalid_cnab.valid?
      required_fields = %i[date cnab_type value document card]

      required_fields.each do |field|
        expect(@invalid_cnab.errors[field]).not_to be_empty
      end
    end

    it 'com dados válidos' do
      expect(@cnab.valid?).to eq(true)
    end
  end

  describe 'extração de dados' do
    it 'interpretação dos dados' do
      @transaction = '3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA'
      @cnab = Cnab.new
      @cnab.parse_cnab(@transaction)

      expect(@cnab.cnab_type).to eq(3)
      expect(@cnab.date).to eq('2019-03-01 17:27:12'.to_datetime)
      expect(@cnab.value).to eq(-192.00)
      expect(@cnab.document).to eq('84515254073')
      expect(@cnab.card).to eq('6777****1313')
    end

    it 'tipo da transação' do
      (1..9).to_a.each do |type|
        @transaction = "#{type}201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA"
        @cnab = Cnab.new
        @cnab.parse_cnab(@transaction)

        if [2, 3, 9].include?(type)
          expect(@cnab.value_type).to eq(-1)
        else
          expect(@cnab.value_type).to eq(1)
        end
      end
    end
  end
end
