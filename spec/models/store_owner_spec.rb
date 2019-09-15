require 'rails_helper'

RSpec.describe StoreOwner, type: :model do
  it { is_expected.to belong_to(:store) }
  it { is_expected.to have_many(:transactions) }
end
