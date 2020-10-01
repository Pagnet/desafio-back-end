RSpec.describe CreditCard, type: :model do
  it { is_expected.to have_many(:transactions) }

  it { is_expected.to respond_to(:first_digits) }
  it { is_expected.to respond_to(:last_digits) }
  it { is_expected.to respond_to(:transactions) }

  it { is_expected.to validate_presence_of(:first_digits) }
  it { is_expected.to validate_presence_of(:last_digits) }
end
