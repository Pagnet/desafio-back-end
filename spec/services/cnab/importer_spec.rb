require 'rails_helper'

RSpec.describe CNAB::Importer do
  let(:cnab_file) { File.open(Rails.root.join('spec', 'support', 'CNAB_sample.txt'), 'r') }
  let!(:existing_store) { create(:store, name: 'BAR DO JOÃO') }
  let!(:existing_store_owner) { create(:store_owner, name: 'JOÃO MACEDO', store: existing_store) }
  let(:ordered_transactions) { Transaction.order(created_at: :asc) }

  describe '#call' do
    subject { described_class.new(File.basename(cnab_file.path), cnab_file.read).call }

    before { Rails.application.load_seed }

    it 'creates transactions' do
      expect { subject }.to change { Transaction.count }.by 6
    end

    it 'creates stores that are not in the database' do
      expect { subject }.to change { Store.count }.by 2
    end

    it 'parses transaction type' do
      subject
      expect(ordered_transactions.map(&:transaction_type).map(&:type_num)).to eq([3, 5, 3, 2, 1, 2])
    end

    it 'parses date of occurrence' do
      subject
      expect(ordered_transactions.map{|t| t.occurred_at.to_date}).to eq([
        Date.new(2019, 03, 01),
        Date.new(2019, 03, 01),
        Date.new(2019, 03, 01),
        Date.new(2019, 03, 01),
        Date.new(2019, 03, 01),
        Date.new(2019, 03, 11),
      ])
    end

    it 'parses value' do
      subject
      expect(ordered_transactions.map(&:value)).to eq([
        '142.00',
        '132.00',
        '122.00',
        '112.00',
        '152.00',
        '107.00',
      ].map{|n| BigDecimal(n)})
    end

    it 'parses CPF' do
      subject
      expect(ordered_transactions.map(&:cpf)).to eq([
        '09620676017',
        '55641815063',
        '84515254073',
        '09620676017',
        '09620676017',
        '84515254073'
      ])
    end

    it 'parses credit card number' do
      subject
      expect(ordered_transactions.map(&:credit_card_number)).to eq([
        '4753****3153',
        '3123****7687',
        '6777****1313',
        '3648****0099',
        '1234****7890',
        '8723****9987'
      ])
    end

    it 'parses occurrence time' do
      subject
      expect(ordered_transactions.map{|t| t.occurred_at.strftime('%H%M%S')}).to eq([
        '153453',
        '145607',
        '172712',
        '234234',
        '233000',
        '123333'
      ])
    end

    it 'parses the store owner name' do
      subject
      joao = StoreOwner.find_by_name('JOÃO MACEDO')
      maria = StoreOwner.find_by_name('MARIA JOSEFINA')
      marcos = StoreOwner.find_by_name('MARCOS PEREIRA')
      expect(ordered_transactions.map(&:store_owner)).to eq([
        joao,
        maria,
        marcos,
        joao,
        joao,
        marcos
      ])
    end

    it 'parses the store name' do
      subject
      bar_do_joao = Store.find_by_name('BAR DO JOÃO')
      loja_do_o = Store.find_by_name('LOJA DO Ó - MATRIZ')
      mercado_da_avenida = Store.find_by_name('MERCADO DA AVENIDA')
      expect(ordered_transactions.map(&:store)).to eq([
        bar_do_joao,
        loja_do_o,
        mercado_da_avenida,
        bar_do_joao,
        bar_do_joao,
        mercado_da_avenida
      ])
    end
  end
end
