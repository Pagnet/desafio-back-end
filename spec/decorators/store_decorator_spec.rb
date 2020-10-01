RSpec.describe StoreDecorator do
  let(:store) { FactoryBot.create(:store).decorate }

  it 'should store decorated' do
    expect(store).to be_decorated
  end

  it { expect(store).to respond_to(:current_balance) }
  it { expect(store).to respond_to(:total_input) }
  it { expect(store).to respond_to(:total_output) }
end
