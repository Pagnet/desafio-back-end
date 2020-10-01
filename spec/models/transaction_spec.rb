RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:transaction_type) }
  it { is_expected.to belong_to(:store) }
  it { is_expected.to belong_to(:credit_card) }

  it { is_expected.to respond_to(:event_date_time) }
  it { is_expected.to respond_to(:amount) }
  it { is_expected.to respond_to(:beneficiary_cpf) }
  it { is_expected.to respond_to(:transaction_type) }
  it { is_expected.to respond_to(:store) }
  it { is_expected.to respond_to(:credit_card) }

  it { is_expected.to validate_presence_of(:event_date_time) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:beneficiary_cpf) }
end
