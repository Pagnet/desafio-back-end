RSpec.describe TransactionDecorator do
  let(:transaction) { FactoryBot.create(:transaction).decorate }

  it 'should store decorated' do
    expect(transaction).to be_decorated
  end

  it { expect(transaction).to respond_to(:transaction_type) }
  it { expect(transaction).to respond_to(:event_date_time) }
  it { expect(transaction).to respond_to(:beneficiary_cpf) }
  it { expect(transaction).to respond_to(:credit_card_number) }
end
