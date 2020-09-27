# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CnabReader do
  subject(:execute) { described_class.new(file_path).execute }

  let(:file_path) { 'spec/fixtures/cnab_sample.txt' }

  let(:store_collection) do
    [
      { name: 'BAR DO RAIMUNDO', storekeeper: 'RAIMUNDO SILVA' },
      { name: 'MERCADO DA AVENIDA', storekeeper: 'MARIA FEREIRA' }
    ]
  end

  let(:store_operation_collection) do
    [
      {
        operated_at: ActiveSupport::TimeZone['UTC'].parse('2020-09-27 15:34:53'),
        amount: 64_800,
        card: '4753****3153',
        document: '09620676017',
        kind: 'financing'
      },
      {
        operated_at: ActiveSupport::TimeZone['UTC'].parse('2020-09-27 17:27:12'),
        amount: 24_400,
        card: '6777****1313',
        document: '84515254073',
        kind: 'loan'
      },
      {
        operated_at: ActiveSupport::TimeZone['UTC'].parse('2020-09-27 23:42:34'),
        amount: 32_000,
        card: '3648****0099',
        document: '09620676017',
        kind: 'boleto'
      }
    ]
  end

  let(:stores) do
    Store.all.map do |store|
      store.attributes.except('id', 'created_at', 'updated_at').deep_symbolize_keys
    end
  end

  let(:store_operations) do
    StoreOperation.all.map do |store_operation|
      store_operation.attributes.except('id', 'created_at', 'updated_at', 'store_id').deep_symbolize_keys
    end
  end

  it { expect { execute }.to change(Store, :count).by(2).and(change(StoreOperation, :count).by(3)) }

  it 'creates stores and operations', :aggregate_failures do
    execute

    store_collection.each { |store| expect(stores).to include(store) }
    store_operation_collection.each { |operation| expect(store_operations).to include(operation) }
  end
end
