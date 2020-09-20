require 'rails_helper'

RSpec.describe Shopkeeper, type: :model do
  it { should have_many(:negotiations) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:representative) }
  it { should validate_uniqueness_of(:name) }
end
