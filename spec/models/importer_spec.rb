require 'rails_helper'

RSpec.describe Importer, type: :model do
  it { is_expected.to validate_presence_of(:file) }
  it { is_expected.to have_many(:transactions) }
end
