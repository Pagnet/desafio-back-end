require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { is_expected.to have_many(:transactions) }

  it { is_expected.to validate_presence_of(:cpf) }
  it { is_expected.to validate_uniqueness_of(:cpf) }
end
