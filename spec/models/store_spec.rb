require 'rails_helper'

RSpec.describe Store, type: :model do
  it { is_expected.to have_many(:transactions) }
  it { is_expected.to have_many(:store_owners) }
  it { is_expected.to validate_presence_of(:name) }
end
