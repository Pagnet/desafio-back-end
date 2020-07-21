require 'rails_helper'

RSpec.describe FileImported, type: :model do
  it { is_expected.to validate_presence_of(:file) }
end
