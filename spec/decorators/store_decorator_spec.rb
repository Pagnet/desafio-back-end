require 'rails_helper'

RSpec.describe StoreDecorator do
  let(:store) { FactoryBot.create(:store).decorate }
  let(:store_with_many_transaction) { FactoryBot.create(:store_with_many_transaction).decorate }

  it 'should store decorated' do
    expect(store).to be_decorated
  end

  # Respond to validations
  it { expect(store).to respond_to(:total_transactions) }
  it { expect(store).to respond_to(:current_balance) }
  it { expect(store).to respond_to(:total_input) }
  it { expect(store).to respond_to(:total_output) }

  it 'should return the total count of transaction in integer' do
    expect(store_with_many_transaction.total_transactions).to eq(5)
  end

  it 'should return the total count of transaction in integer' do
    expect(store_with_many_transaction.current_balance).to eq(-500)
  end

  it 'should return the total count of transaction in integer' do
    expect(store_with_many_transaction.total_input).to eq(0)
  end

  it 'should return the total count of transaction in integer' do
    expect(store_with_many_transaction.total_output).to eq(500)
  end
end
