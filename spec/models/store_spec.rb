RSpec.describe Store, type: :model do
  it { is_expected.to have_many(:transactions) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:owner_name) }
  it { is_expected.to respond_to(:transactions) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:owner_name) }
end
